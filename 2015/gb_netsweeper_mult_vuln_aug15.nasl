###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_netsweeper_mult_vuln_aug15.nasl 8601 2018-01-31 12:07:42Z cfischer $
#
# Netsweeper Multiple Vulnerabilities - Aug15
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
CPE = "cpe:/a:netsweeper:netsweeper";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805962");
  script_version("$Revision: 8601 $");
  script_cve_id("CVE-2014-9612", "CVE-2014-9605", "CVE-2014-9610", "CVE-2014-9619");
  script_tag(name:"cvss_base", value:"7.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-01-31 13:07:42 +0100 (Wed, 31 Jan 2018) $");
  script_tag(name:"creation_date", value:"2015-08-25 14:52:59 +0530 (Tue, 25 Aug 2015)");
  script_tag(name:"qod_type", value:"exploit");
  script_name("Netsweeper Multiple Vulnerabilities - Aug15");

  script_tag(name: "summary" , value:"The host is running Netsweeper and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Send a crafted request via HTTP GET and
  check whether it is able to execute sql query or not.");

  script_tag(name:"insight", value:"Multiple flaws exist as,
  - Input passed via 'server' parameter to load_logfiles.php script is not
  validated before returning to users.
  - The application does not validate input against crafted requests.
  - Unspecified errors.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to inject or manipulate SQL queries in the back-end database
  allowing for the manipulation or disclosure of arbitrary data, allowing
  arbitrary file upload and execution, and authentication bypass.

  Impact Level: Application");

  script_tag(name:"affected", value:"Netsweeper before versions 3.1.10, 4.0.9 and
  4.1.2.");

  script_tag(name: "solution" , value:"Upgrade to Netsweeper version 3.1.10,
  4.0.9 or 4.1.2 or later. For updates refer to http://www.netsweeper.com/");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://www.exploit-db.com/exploits/37927");
  script_xref(name : "URL" , value : "https://www.exploit-db.com/exploits/37928");
  script_xref(name : "URL" , value : "https://www.exploit-db.com/exploits/37929");
  script_xref(name : "URL" , value : "https://www.exploit-db.com/exploits/37932");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_netsweeper_remote_detect.nasl");
  script_mandatory_keys("Netsweeper/Installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

if(!netPort = get_app_port(cpe:CPE)){
  exit(0);
}

url = '/remotereporter/load_logfiles.php?server="SQL-INJECTION-TEST&url=test';

if(http_vuln_check(port:netPort, url:url, check_header:TRUE,
   pattern:"SQL-INJECTION-TEST",
   extra_check: "You have an error in your SQL syntax"))
{
  report = report_vuln_url( port:netPort, url:url);
  security_message(port:netPort, data:report);
  exit(0);
}
