###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_java_mult_unspecified_vuln01_oct15.nasl 7699 2017-11-08 12:10:34Z santu $
#
# Oracle Java SE JRE Multiple Unspecified Vulnerabilities-01 Oct 2015 (Windows)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:oracle:jre";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806511");
  script_version("$Revision: 7699 $");
  script_cve_id("CVE-2015-4916", "CVE-2015-4908", "CVE-2015-4906", "CVE-2015-4901",
                "CVE-2015-4868");
  script_bugtraq_id(77221, 77223, 77214, 77226, 77225);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-11-08 13:10:34 +0100 (Wed, 08 Nov 2017) $");
  script_tag(name:"creation_date", value:"2015-10-27 11:40:31 +0530 (Tue, 27 Oct 2015)");
  script_name("Oracle Java SE JRE Multiple Unspecified Vulnerabilities-01 Oct 2015 (Windows)");

  script_tag(name: "summary" , value:"The host is installed with Oracle Java SE
  JRE and is prone to multiple unspecified vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws are due to multiple
  unspecified errors.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attackers
  to have an impact on confidentiality, integrity, and availability via unknown
  vectors.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Oracle Java SE 8 update 60 and prior
  on Windows.");

  script_tag(name: "solution" , value:"Apply the patch from below link,
  http://www.oracle.com/technetwork/topics/security/alerts-086861.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/alerts-086861.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_win.nasl");
  script_mandatory_keys("Sun/Java/JRE/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
jreVer = "";

## Get version
if(!jreVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(jreVer =~ "^(1\.8)")
{
  ##Check for Oracle Java SE Versions
  if(version_in_range(version:jreVer, test_version:"1.8.0", test_version2:"1.8.0.60"))
  {
    report = 'Installed version: ' + jreVer + '\n' +
             'Fixed version:     ' + "Apply the patch"  + '\n';
    security_message(data:report);
    exit(0);
  }
}
