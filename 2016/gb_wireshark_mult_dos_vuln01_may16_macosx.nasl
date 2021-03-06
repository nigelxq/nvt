###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_mult_dos_vuln01_may16_macosx.nasl 5712 2017-03-24 10:00:49Z teissa $
#
# Wireshark Multiple Denial of Service Vulnerabilities May16 (Mac OS X)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:wireshark:wireshark";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807578");
  script_version("$Revision: 5712 $");
  script_cve_id("CVE-2016-4084", "CVE-2016-4083", "CVE-2016-4077", "CVE-2016-4076");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-24 11:00:49 +0100 (Fri, 24 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-05-03 11:50:51 +0530 (Tue, 03 May 2016)");
  script_name("Wireshark Multiple Denial of Service Vulnerabilities May16 (Mac OS X)");
  
  script_tag(name:"summary", value:"This host is installed with Wireshark
  and is prone to multiple denial of service vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,
  - 'epan/dissectors/packet-ncp2222.inc' script in the NCP dissector does not 
    properly initialize memory for search patterns.
  - 'epan/reassemble.c' script in TShark relies on incorrect special-case 
    handling of truncated Tvb data structures.
  - 'epan/dissectors/packet-mswsp.c' script in the MS-WSP dissector does not 
    ensure that data is available before array allocation.
  - An integer signedness error in 'epan/dissectors/packet-mswsp.c' script in 
    the MS-WSP dissector");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to conduct denial of service attack.

  Impact Level: Application");

  script_tag(name:"affected", value:"Wireshark version 2.0.x before 2.0.3
  on Mac OS X");

  script_tag(name:"solution", value:"Upgrade to Wireshark version 2.0.3 or
  later.
  For updates refer to https://www.wireshark.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"http://www.wireshark.org/security/wnpa-sec-2016-27.html");
  script_xref(name:"URL", value:"http://www.wireshark.org/security/wnpa-sec-2016-20.html");
  script_xref(name:"URL", value:"http://www.wireshark.org/security/wnpa-sec-2016-19.html");

  script_category(ACT_GATHER_INFO);
  script_family("Denial of Service");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_wireshark_detect_macosx.nasl");
  script_mandatory_keys("Wireshark/MacOSX/Version");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
wirversion = "";

## Get the version
if(!wirversion = get_app_version(cpe:CPE)){
  exit(0);
}

## Check the vulnerable version 
if(version_in_range(version:wirversion, test_version:"2.0.0", test_version2:"2.0.2"))
{
  report = report_fixed_ver(installed_version:wirversion, fixed_version:"2.0.3");
  security_message(data:report);
  exit(0);
}
