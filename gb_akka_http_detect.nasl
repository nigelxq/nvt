###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_akka_http_detect.nasl 9398 2018-04-09 06:17:02Z cfischer $
#
# akka HTTP Detection
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.140485");
  script_version("$Revision: 9398 $");
  script_tag(name: "last_modification", value: "$Date: 2018-04-09 08:17:02 +0200 (Mon, 09 Apr 2018) $");
  script_tag(name: "creation_date", value: "2017-11-03 16:41:02 +0700 (Fri, 03 Nov 2017)");
  script_tag(name: "cvss_base", value: "0.0");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("akka HTTP Detection");

  script_tag(name: "summary" , value: "Detection of akka HTTP server.

The script sends a connection request to the server and attempts to detect akka HTTP server and to extract its
version.");
  
  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("gb_get_http_banner.nasl");
  script_mandatory_keys("akka/banner");
  script_require_ports("Services/www", 443);

  script_xref(name: "URL", value: "https://doc.akka.io/docs/akka-http/current/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 443);

banner = get_http_banner(port: port);

if (egrep(pattern: "akka-http/", string: banner)) {
  version = "unknown";

  vers = eregmatch(pattern: "Server: akka-http/([0-9.]+)", string: banner);
  if (!isnull(vers[1])) {
    version = vers[1];
    set_kb_item(name: "akka_http/version", value: version);
  }

  set_kb_item(name: "akka_http/installed", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:akka:http:");
  if (!cpe)
    cpe = 'cpe:/a:akka:http';

  register_product(cpe: cpe, location: "/", port: port, service: "www");

  log_message(data: build_detection_report(app: "akka HTTP", version: version, install: "/", cpe: cpe,
                                           concluded: vers[0]),
              port: port);
  exit(0);
}

exit(0);
