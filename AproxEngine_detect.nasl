###############################################################################
# OpenVAS Vulnerability Test
# $Id: AproxEngine_detect.nasl 9633 2018-04-26 14:07:08Z jschulte $
#
# AproxEngine CMS Detection
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100425");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 9633 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-26 16:07:08 +0200 (Thu, 26 Apr 2018) $");
 script_tag(name:"creation_date", value:"2010-01-05 18:50:28 +0100 (Tue, 05 Jan 2010)");
 script_tag(name:"cvss_base", value:"0.0");

 script_name("AproxEngine CMS Detection");

 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");

 script_tag(name: "summary", value: "This host is running the AproxEngine CMS.");

 script_xref(name: "URL", value: "http://www.aprox.de");

 exit(0);
}

include("cpe.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

foreach dir( make_list_unique( "/aproxengine", "/cms", cgi_dirs( port:port ) ) ) {
 install = dir;
 if( dir == "/" ) dir = "";

 url = dir + "/engine/inc/version.info";

 req = http_get(item:url, port:port);
 buf = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);
 if( buf == NULL )continue;

 if("AproxEngine" >< buf) {
    vers = "unknown";

    version = eregmatch(string: buf, pattern: "AproxEngine V([0-9.]+)",icase:TRUE);

    if ( !isnull(version[1]) )
      vers = version[1];

    set_kb_item(name: "aproxengine/installed", value: TRUE);

    cpe = build_cpe(value: vers, exp: "^([0-9.]+)", base: "cpe:/a:aprox:aproxengine:");
    if (!cpe)
      cpe = 'cpe:/a:aprox:aproxengine';

    register_product(cpe: cpe, location: install, port: port);

    log_message(data: build_detection_report(app: "AproxEngine CMS", version: vers, install: install, cpe: cpe,
                                             concluded: version[0], concludedUrl: url),
                port: port);
    exit(0);
  }
}

exit(0);
