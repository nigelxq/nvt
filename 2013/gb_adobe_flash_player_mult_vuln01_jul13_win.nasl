###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_mult_vuln01_jul13_win.nasl 9353 2018-04-06 07:14:20Z cfischer $
#
# Adobe Flash Player Multiple Vulnerabilities-01 July13 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803831");
  script_version("$Revision: 9353 $");
  script_cve_id("CVE-2013-3347", "CVE-2013-3345", "CVE-2013-3344");
  script_bugtraq_id(61048, 61045, 61043);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-07-25 17:21:07 +0530 (Thu, 25 Jul 2013)");
  script_name("Adobe Flash Player Multiple Vulnerabilities-01 July13 (Windows)");

  tag_summary = "This host is installed with Adobe Flash Player and is prone to multiple
vulnerabilities.";

  tag_vuldetect = "Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight = "Multiple unspecified error exists and an integer overflow error exists
when resampling a PCM buffer.";

  tag_impact = "Successful exploitation will allow remote attackers to execute arbitrary
code on the target system will cause heap-based buffer overflow or cause
memory corruption via unspecified vectors.

  Impact Level: System/Application";

  tag_affected = "Adobe Flash Player before 11.7.700.232 and 11.8.x before 11.8.800.94 on
Windows";

  tag_solution = "Update to Adobe Flash Player version 11.7.700.232 or 11.8.800.94 or later
For updates refer to  http://get.adobe.com/flashplayer";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/53975");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/bulletins/apsb13-17.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Win/Installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE );
vers = infos['version'];
path = infos['location'];

## Grep for vulnerable version
if( version_is_less( version:vers, test_version:"11.7.700.232" ) ||
    version_in_range( version:vers, test_version:"11.8.0", test_version2:"11.8.800.93" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"11.7.700.232 or 11.8.800.94", install_path:path );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );