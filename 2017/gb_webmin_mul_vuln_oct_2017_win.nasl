###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_webmin_mul_vuln_oct_2017_win.nasl 7739 2017-11-13 05:04:18Z teissa $
#
# Webmin Multiple Vulnerabilities (Windows)
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:webmin:webmin";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107250");
  script_version("$Revision: 7739 $");
  script_cve_id("CVE-2017-15644", "CVE-2017-15645", "CVE-2017-15646");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-11-13 06:04:18 +0100 (Mon, 13 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-10-16 12:05:05 +0530 (Mon, 16 Oct 2017)");
  script_name("Webmin Multiple Vulnerabilities (Windows)");

  script_tag(name:"summary", value:"This host is running Webmin and is prone
  to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Check for vulnerable version.");

  script_tag(name:"insight", value:"Webmin echo back the 'File Download' request
  status which we can trigger the XSS vulnerability and bypass this Referrer check
  by setting the domain=webmin-victim-ip. User controlled input is not sufficiently
  sanitized which can lead to CSRF and Server side Request Forgery.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to perform the following attacks:

  - XSS vulnerability that leads to Remote Code Execution

  - CSRF Schedule arbitrary commands

  - Server Side Request Forgery

  Impact Level: Application");

  script_tag(name:"affected", value:"Webmin version prior to 1.860");

  script_tag(name:"solution", value:"Upgrade to webmin version 1.860
  For more information refer to http://www.webmin.com/security.html");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");
  script_xref(name:"URL", value:"https://blogs.securiteam.com/index.php/archives/3430");
  script_xref(name:"URL", value:"https://github.com/webmin/webmin/commit/0c58892732ee7610a7abba5507614366d382c9c9");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("webmin.nasl", "os_detection.nasl");
  script_mandatory_keys("webmin/installed", "Host/runs_windows");
  script_require_ports("Services/www", 10000, 20000);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!Port = get_app_port(cpe:CPE)){
 exit(0);
}

if(!Ver = get_app_version(cpe:CPE, port:Port)){
 exit(0);
}

if(version_is_less(version:Ver, test_version:"1.860"))
{
  report = report_fixed_ver(installed_version:Ver, fixed_version:"1.860");
  security_message(data:report, port:Port);
  exit(0);
}
exit(0);
