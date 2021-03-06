###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln01_may14_lin.nasl 6715 2017-07-13 09:57:40Z teissa $
#
# Google Chrome Multiple Vulnerabilities - 01 May14 (Linux)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:google:chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804602");
  script_version("$Revision: 6715 $");
  script_cve_id("CVE-2014-1740", "CVE-2014-1741", "CVE-2014-1742");
  script_bugtraq_id(67374, 67376, 67375);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-13 11:57:40 +0200 (Thu, 13 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-05-21 15:25:49 +0530 (Wed, 21 May 2014)");
  script_name("Google Chrome Multiple Vulnerabilities - 01 May14 (Linux)");

  tag_summary =
"The host is installed with Google Chrome and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"The flaws are due to,
- A use-after-free error in WebSockets.
- An integer overflow error in the 'CharacterData::deleteData' and
'CharacterData::replaceData' functions in dom/CharacterData.cpp.
- A use-after-free error in the 'FrameSelection::updateAppearance' function in
editing/FrameSelection.cpp related to editing.";

  tag_impact =
"Successful exploitation will allow remote attackers to conduct a denial of
service and potentially execute arbitrary code.

Impact Level: System/Application";

  tag_affected =
"Google Chrome version prior to 34.0.1847.137 on Linux.";

  tag_solution =
"Upgrade to Google Chrome 34.0.1847.137 or later,
For updates refer to http://www.google.com/chrome";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"executable_version");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.in/2014/05/stable-channel-update.html");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_lin.nasl");
  script_mandatory_keys("Google-Chrome/Linux/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
chromeVer = "";

## Get version
if(!chromeVer = get_app_version(cpe:CPE))
{
  error_message(data:"Unable to fetch google chrome version.");
  exit(-1);
}

## Grep for vulnerable version
if(version_is_less(version:chromeVer, test_version:"34.0.1847.137"))
{
  security_message(0);
  exit(0);
}
