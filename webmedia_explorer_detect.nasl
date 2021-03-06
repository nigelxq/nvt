###############################################################################
# OpenVAS Vulnerability Test
# $Id: webmedia_explorer_detect.nasl 9043 2018-03-07 12:38:58Z cfischer $
#
# Webmedia Explorer Detection
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100224");
  script_version("$Revision: 9043 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-07 13:38:58 +0100 (Wed, 07 Mar 2018) $");
  script_tag(name:"creation_date", value:"2009-06-21 16:51:00 +0200 (Sun, 21 Jun 2009)");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Webmedia Explorer Detection");
  script_category(ACT_GATHER_INFO);
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://www.webmediaexplorer.com/");

  tag_summary = "This host is running Webmedia Explorer an free Open Source PHP
  engine that reads your hard disc as a conventional disc explorer and
  generates a website realtime taking advantage of a very powerful
  rendering and data fetching caching system.";

  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/fileexplorer", "/explorer", "/wme", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";
  url = dir + "/index.php?action=login";

  req = http_get( item:url, port:port );
  buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );
  if( isnull( buf ) ) continue;

  if( egrep( pattern:'Powered by <a [^>]+>webmedia explorer', string:buf, icase:TRUE ) &&
      egrep( pattern:"Set-Cookie: dir_stack_cookie", string:buf ) ) {

    version = "unknown";
    vers = eregmatch( string:buf, pattern:"webmedia explorer ([0-9.]+)", icase:TRUE );
    if( ! isnull( vers[1] ) ) version = chomp( vers[1] );

    tmp_version = version + " under " + install;
    set_kb_item( name:"www/" + port + "/WebmediaExplorer", value:tmp_version );
    set_kb_item( name:"WebmediaExplorer/detected", value:TRUE );

    cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:webmediaexplorer:webmedia_explorer:" );
    if( isnull( cpe ) )
      cpe = "cpe:/a:webmediaexplorer:webmedia_explorer";

    register_product( cpe:cpe, location:install, port:port );

    log_message( data:build_detection_report( app:"Webmedia Explorer",
                                              version:version,
                                              install:install,
                                              cpe:cpe,
                                              concluded:vers[0] ),
                                              port:port );
    exit( 0 );
  }
}

exit( 0 );
