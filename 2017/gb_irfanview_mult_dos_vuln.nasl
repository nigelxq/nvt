###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_irfanview_mult_dos_vuln.nasl 9710 2018-05-03 11:12:48Z asteins $
#
# IrfanView Multiple DoS Vulnerabilities
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:irfanview:irfanview:x64";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811953");
  script_version("$Revision: 9710 $");
  script_cve_id("CVE-2017-15769", "CVE-2017-15768", "CVE-2017-15766", "CVE-2017-15767",
                "CVE-2017-15765", "CVE-2017-15764", "CVE-2017-15763", "CVE-2017-15762",
                "CVE-2017-15761", "CVE-2017-15759", "CVE-2017-15760", "CVE-2017-15758",
                "CVE-2017-15757", "CVE-2017-15756", "CVE-2017-15755", "CVE-2017-15754",
                "CVE-2017-15752", "CVE-2017-15753", "CVE-2017-15751", "CVE-2017-15750",
                "CVE-2017-15749", "CVE-2017-15748", "CVE-2017-15747", "CVE-2017-15745",
                "CVE-2017-15746", "CVE-2017-15744", "CVE-2017-15743", "CVE-2017-15742",
                "CVE-2017-15741", "CVE-2017-15740", "CVE-2017-15738", "CVE-2017-15739",
                "CVE-2017-15737");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-05-03 13:12:48 +0200 (Thu, 03 May 2018) $");
  script_tag(name:"creation_date", value:"2017-10-26 10:40:33 +0530 (Thu, 26 Oct 2017)");
  script_name("IrfanView Multiple DoS Vulnerabilities");

  script_tag(name: "summary" , value:"This host is installed with IrfanView and is
  prone to multiple denial of service vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of the detection NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exits due to

  - Read Access Violation.

  - Data from Faulting Address controls Branch Selection.

  - User Mode Write AV near NULL.

  - For more information refer to reference links ");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to to execute arbitrary code or cause a denial of service.

  Impact Level: Application");

  script_tag(name: "affected" , value:"IrfanView Version 4.50 64-bit");

  script_tag(name: "solution" , value:"No solution or patch is available as of
  03rd May, 2018. Information regarding this issue will be updated once
  solution details are available.
  For updates refer to http://www.irfanview.com/");

  script_tag(name:"solution_type", value:"NoneAvailable");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name : "URL" , value : "https://github.com/wlinzi/security_advisories");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_irfanview_detect.nasl");
  script_mandatory_keys("IrfanView/Ver/x64");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!irfVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(irfVer == "4.50")
{
  report = report_fixed_ver(installed_version:irfVer, fixed_version:"NoneAvailable");
  security_message(data:report);
  exit(0);
}
