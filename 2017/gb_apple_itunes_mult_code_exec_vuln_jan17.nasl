###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_itunes_mult_code_exec_vuln_jan17.nasl 8169 2017-12-19 08:42:31Z cfischer $
#
# Apple iTunes Multiple Code Execution Vulnerabilities Jan17 (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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
CPE = "cpe:/a:apple:itunes";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810526");
  script_version("$Revision: 8169 $");
  script_cve_id("CVE-2017-2354", "CVE-2017-2355", "CVE-2017-2356", "CVE-2017-2366");
  script_bugtraq_id(95736, 95733);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-12-19 09:42:31 +0100 (Tue, 19 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-01-30 13:20:32 +0530 (Mon, 30 Jan 2017)");
  script_name("Apple iTunes Multiple Code Execution Vulnerabilities Jan17 (Windows)");

  script_tag(name: "summary" , value: "This host is installed with Apple iTunes
  and is prone to multiple code execution vulnerabilities.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "Multiple flaws are due to multiple memory
  corruption and initialization errors.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to execute arbitrary code. Failed exploit attempts may result in a 
  denial-of-service condition.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Apple iTunes versions before 12.5.5
  on Windows.");

  script_tag(name: "solution" , value:"Upgrade to Apple iTunes 12.5.5 or later,
  For updates refer to http://www.apple.com/itunes");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name: "URL" , value : "https://support.apple.com/en-us/HT207486");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_apple_itunes_detection_win_900123.nasl");
  script_mandatory_keys("iTunes/Win/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
ituneVer= "";

## Get version
if(!ituneVer = get_app_version(cpe:CPE)){
  exit(0);
}

##  Check for Apple iTunes vulnerable versions
if(version_is_less(version:ituneVer, test_version:"12.5.5"))
{
  report = report_fixed_ver(installed_version:ituneVer, fixed_version:"12.5.5");
  security_message(data:report);
  exit(0);
}
