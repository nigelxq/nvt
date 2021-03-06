###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_solgens_ecommerce_sql_inj_vuln.nasl 5792 2017-03-30 13:18:14Z cfi $
#
# SolGens E-Commerce 'cid' And 'pid' Parameters SQL Injection Vulnerability
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802387");
  script_version("$Revision: 5792 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-30 15:18:14 +0200 (Thu, 30 Mar 2017) $");
  script_tag(name:"creation_date", value:"2012-02-01 13:14:14 +0530 (Wed, 01 Feb 2012)");
  script_name("SolGens E-Commerce 'cid' And 'pid' Parameters SQL Injection Vulnerability");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/108947/solgensecommerce-sql.txt");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name : "impact" , value : "Successful exploitation will allow attacker to perform SQL injection
  attack and gain sensitive information.

  Impact Level: Application");
  script_tag(name : "affected" , value : "SolGens E-Commerce");
  script_tag(name : "insight" , value : "The flaws are caused by improper validation of user-supplied input
  sent via the 'cid' and 'pid' parameters to 'product_detail.php',
  'category_products.php' and 'order_product.php' scripts, which allows
  attackers to manipulate SQL queries by injecting arbitrary SQL code.");
  script_tag(name : "solution" , value : "No solution or patch was made available for at least one year
  since disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective
  features, remove the product or replace the product by another one.");
  script_tag(name : "summary" , value : "This host is running SolGens E-Commerce and is prone to SQL injection
  vulnerability.");

  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"remote_app");
  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

if(!can_host_php(port:port)){
  exit(0);
}

foreach dir (make_list_unique("/solgens", "/SolGens", cgi_dirs(port:port)))
{

  if(dir == "/") dir = "";

  rcvRes = http_get_cache(item:string(dir, "/index.php"), port:port);

  ## Confirm the application
  if(egrep(pattern:">.?SolGens", string:rcvRes))
  {
    ## Construct the Attack Request
    url = dir + "/product_detail.php?pid='";

    if(http_vuln_check(port:port, url:url, pattern:">Warning<.*supplied " +
      "argument is not a valid MySQL result resource in.*product_detail.php"))
    {
      security_message(port:port);
      exit(0);
    }
  }
}

exit(99);