###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_disk_sorter_enterprise_server_detect.nasl 8147 2017-12-15 13:51:17Z cfischer $
#
# Disk Sorter Enterprise Server Version Detection
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.810300");
  script_version("$Revision: 8147 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-12-15 14:51:17 +0100 (Fri, 15 Dec 2017) $");
  script_tag(name:"creation_date", value:"2016-12-06 10:26:00 +0530 (Tue, 06 Dec 2016)");
  script_name("Disk Sorter Enterprise Server Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("Host/runs_windows");
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"Detection of installed version of
  Disk Sorter Enterprise Server.

  This script sends HTTP GET request and try to get the version from the
  response.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("cpe.inc");
include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

sorterPort = get_http_port( default:80 );

rcvRes = http_get_cache( item:"/login", port:sorterPort );

if( "Disk Sorter Enterprise Login" >< rcvRes && ">User Name" >< rcvRes && ">Password" >< rcvRes ) {

  install = "/";
  sorterVer = "unknown"; 

  vers = eregmatch( pattern:">Disk Sorter Enterprise v([0-9.]+)", string:rcvRes );
  if( vers[1] ) sorterVer = vers[1];

  set_kb_item( name:"DiskSorter/Enterprise/Server/installed", value:TRUE );

  cpe = build_cpe( value:sorterVer, exp:"([0-9.]+)", base:"cpe:/a:disksorter:disksorter_enterprise_web_server:" );
  if( isnull( cpe ) )
    cpe = "cpe:/a:disksorter:disksorter_enterprise_web_server";

  register_product( cpe:cpe, location:install, port:sorterPort );
  log_message( data:build_detection_report( app:"Disk Sorter Enterprise Server",
                                            version:sorterVer,
                                            install:install,
                                            cpe:cpe,
                                            concluded:vers[0] ),
                                            port:sorterPort );
}

exit( 0 );
