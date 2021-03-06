###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_imagemagick_info_disc_n_sec_bypass_vuln_macosx.nasl 5752 2017-03-29 04:01:01Z teissa $
#
# ImageMagick Information Disclosure And Security Bypass Vulnerabilities (Mac OS X)
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

CPE = "cpe:/a:imagemagick:imagemagick";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810500");
  script_version("$Revision: 5752 $");
  script_cve_id("CVE-2016-10047", "CVE-2016-10048");
  script_bugtraq_id(95182, 95186);
  script_tag(name:"cvss_base", value:"7.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-29 06:01:01 +0200 (Wed, 29 Mar 2017) $");
  script_tag(name:"creation_date", value:"2017-01-17 15:32:50 +0530 (Tue, 17 Jan 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("ImageMagick Information Disclosure And Security Bypass Vulnerabilities (Mac OS X)");

  script_tag(name: "summary" , value:"The host is installed with ImageMagick
  and is prone to an information disclosure and security bypass vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws are due to,
  - The memory leak error in XML file transversal.
  - The relative path is not escaped while arbitrary module loading.");

  script_tag(name: "impact" , value:"Successful exploitation will allow
  attackers to gain access to sensitive information that may aid in further 
  attacks and bypass certain security restrictions to perform unauthorized 
  actions.

  Impact Level: Application");

  script_tag(name: "affected" , value:"ImageMagick versions before 6.9.4-7
  on Mac OS X.");

  script_tag(name: "solution" , value:"Upgrade to ImageMagick version
  6.9.4-7 or later. For updates refer to http://www.imagemagick.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://seclists.org/oss-sec/2016/q4/758");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_imagemagick_detect_macosx.nasl");
  script_mandatory_keys("ImageMagick/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
imVer = "";
report = "";

## Get version
if(!imVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:imVer, test_version:"6.9.4.7"))
{
  report = report_fixed_ver(installed_version:imVer, fixed_version:'6.9.4-7');
  security_message(data:report);
  exit(0);
}
