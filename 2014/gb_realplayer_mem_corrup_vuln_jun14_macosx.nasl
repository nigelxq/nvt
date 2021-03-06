###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_realplayer_mem_corrup_vuln_jun14_macosx.nasl 6750 2017-07-18 09:56:47Z teissa $
#
# RealNetworks RealPlayer '.3gp' Memory Corruption Vulnerability Jun14 (Mac OS X)
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

CPE = "cpe:/a:realnetworks:realplayer";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804620");
  script_version("$Revision: 6750 $");
  script_cve_id("CVE-2014-3444");
  script_bugtraq_id(67434);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-18 11:56:47 +0200 (Tue, 18 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-06-06 19:16:08 +0530 (Fri, 06 Jun 2014)");
  script_name("RealNetworks RealPlayer '.3gp' Memory Corruption Vulnerability Jun14 (Mac OS X)");

  tag_summary =
"The host is installed with RealPlayer and is prone to memory corruption
vulnerability.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Flaw is due to input not being properly sanitized when handling a specially
crafted 3GP file.";

  tag_impact =
"Successful exploitation will allow remote attackers to corrupt memory, causing
a denial of service or potentially allowing the execution of arbitrary code.

Impact Level: System/Application";

 tag_affected =
"RealNetworks RealPlayer version 16.0.3.51 and before on Mac OS X.";

  tag_solution =
"No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"WillNotFix");

  script_xref(name : "URL" , value : "http://packetstormsecurity.com/files/126637");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_realplayer_detect_macosx.nasl");
  script_mandatory_keys("RealPlayer/MacOSX/Version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
realVer = "";

## Get version
if(!realVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_in_range(version:realVer, test_version:"16.0", test_version2:"16.0.3.51"))
{
  security_message(0);
  exit(0);
}
