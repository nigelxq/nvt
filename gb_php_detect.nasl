###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_detect.nasl 10711 2018-08-01 13:58:38Z cfischer $
#
# PHP Version Detection (Remote)
#
# Authors:
# Veerendra GG <veerendragg@secpod.com>
#
# Copyright:
# Copyright (c) 2008 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800109");
  script_version("$Revision: 10711 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-01 15:58:38 +0200 (Wed, 01 Aug 2018) $");
  script_tag(name:"creation_date", value:"2008-10-07 16:11:33 +0200 (Tue, 07 Oct 2008)");
  script_name("PHP Version Detection (Remote)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "phpinfo.nasl", "webmirror.nasl",
  "gb_php_detect_lin.nasl", "secpod_php_detect_win.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"Detects the installed version of PHP.
  This script sends HTTP GET request and try to get the version from the
  response, and sets the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

checkFiles = make_list();

port = get_http_port( default:80 );
host = http_host_name( dont_add_port:TRUE );

phpinfoBanner = get_kb_item( "php/phpinfo/phpversion/" + port );

foreach dir( make_list_unique( "/", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  checkFiles = make_list( checkFiles, dir + "/", dir + "/index.php" );
}

phpFilesList = get_http_kb_file_extensions( port:port, host:host, ext:"php" );
if( phpFilesList ) checkFiles = make_list_unique( checkFiles, phpFilesList );

foreach checkFile( checkFiles ) {

  banner = get_http_banner( port:port, file:checkFile );

  if( "PHP" >< banner ) {
    phpInfo = egrep( pattern:"Server.*PHP.*", string:banner );
    if( ! phpInfo ) {
      phpInfo = egrep( pattern:"X.Powered.By.*PHP.*", string:banner );
    }

    if( "PHPSESSID" >< banner ) phpSessId = TRUE;

    # e.g PHP/5.6.0alpha1 or PHP/5.6.0
    phpVer = ereg_replace( pattern:".*PHP/([.0-9A-Za-z]*).*", string:phpInfo, replace:"\1" );
    if( ! isnull( phpVer ) && phpVer != "" ) break;
  }
}

if( isnull( phpVer ) || phpVer == "" ) {
  phpVer  = phpinfoBanner;
  phpInfo = phpinfoBanner;
}

if( phpVer || phpSessId ) {

  location = port + "/tcp";
  if( ! phpInfo && phpSessId )
    phpInfo = "PHPSESSID Session-Cookie";

  if( ! phpVer ) phpVer = "unknown";

  set_kb_item( name:"www/" + port + "/PHP", value:phpVer );
  set_kb_item( name:"php/installed", value:TRUE );

  cpe = build_cpe( value:phpVer, exp:"^([0-9.A-Za-z]+)", base:"cpe:/a:php:php:" );
  if( isnull( cpe ) || phpVer == "unknown" )
    cpe = "cpe:/a:php:php";

  register_product( cpe:cpe, location:location, port:port );

  log_message( data:build_detection_report( app:"PHP",
                                            version:phpVer,
                                            install:location,
                                            cpe:cpe,
                                            concluded:phpInfo ),
                                            port:port );
}

exit( 0 );
