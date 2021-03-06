###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_mult_vuln_may14_win.nasl 8178 2017-12-19 13:42:38Z cfischer $
#
# Adobe Flash Player Multiple Vulnerabilities - May14 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:flash_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804589");
  script_version("$Revision: 8178 $");
  script_cve_id("CVE-2014-0516", "CVE-2014-0517", "CVE-2014-0518", "CVE-2014-0519",
                "CVE-2014-0520");
  script_bugtraq_id(67361, 67364, 67371, 67373, 67372);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-12-19 14:42:38 +0100 (Tue, 19 Dec 2017) $");
  script_tag(name:"creation_date", value:"2014-05-22 12:37:43 +0530 (Thu, 22 May 2014)");
  script_name("Adobe Flash Player Multiple Vulnerabilities - May14 (Windows)");

  tag_summary =
"This host is installed with Adobe Flash Player and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Multiple flaws are due to an use-after free error when handling display
objects and multiple unspecified errors.";

  tag_impact =
"Successful exploitation will allow attackers to bypass certain security
restrictions and compromise a user's system.

Impact Level: System/Application";

  tag_affected =
"Adobe Flash Player version before 13.0.0.214 on Windows";

  tag_solution =
"Update to Adobe Flash Player version 13.0.0.214 or later,
For updates refer to  http://get.adobe.com/flashplayer";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/58074");
  script_xref(name : "URL" , value : "http://helpx.adobe.com/security/products/flash-player/apsb14-14.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Win/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
playerVer = "";

## Get version
if(!playerVer = get_app_version(cpe:CPE)){
  error_message(data:"Unable to fetch adobe flash version.");
  exit(-1);
}

## Grep for vulnerable version
if(version_is_less(version:playerVer, test_version:"13.0.0.214"))
{
  security_message(0);
  exit(0);
}
