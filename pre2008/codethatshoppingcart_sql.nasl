###############################################################################
# OpenVAS Vulnerability Test
# $Id: codethatshoppingcart_sql.nasl 6040 2017-04-27 09:02:38Z teissa $
#
# CodeThatShoppingCart Input Validation Vulnerabilities
#
# Authors:
# Josh Zlatin-Amishav <josh at tkos dot co dot il>
#
# Copyright:
# Copyright (C) 2005 Josh Zlatin-Amishav
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
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
  script_oid("1.3.6.1.4.1.25623.1.0.18255");
  script_version("$Revision: 6040 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-27 11:02:38 +0200 (Thu, 27 Apr 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_cve_id("CVE-2005-1593", "CVE-2005-1594", "CVE-2005-1595");
  script_bugtraq_id(13560);
  script_xref(name:"OSVDB", value:"16155");
  script_xref(name:"OSVDB", value:"16156");
  script_xref(name:"OSVDB", value:"16157");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("CodeThatShoppingCart Input Validation Vulnerabilities");
  script_family("Web application abuses");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2005 Josh Zlatin-Amishav");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  tag_summary = "The remote host is running the CodeThat.com ShoppingCart, a shopping cart
  program written in PHP.

  The remote version of this software contains an input validation flaw leading
  to a SQL injection vulnerability. An attacker may exploit this flaw to execute
  arbitrary commands against the remote database.";

  tag_solution = "Unknown at this time";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );
if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = dir + "/catalog.php?action=category_show&id='";

  if( http_vuln_check( port:port, url:url, pattern:"select id from products P, category_products CP where P.id=CP.product_id and CP.category_id=" ) ) {
    report = report_vuln_url( port:port, url:url );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
