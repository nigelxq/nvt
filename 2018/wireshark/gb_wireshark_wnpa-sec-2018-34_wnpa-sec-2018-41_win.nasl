###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wireshark_wnpa-sec-2018-34_wnpa-sec-2018-41_win.nasl 10558 2018-07-20 14:08:23Z santu $
#
# Wireshark Security Updates (wnpa-sec-2018-34_wnpa-sec-2018-41) Windows
#
# Authors:
# Rajat Mishra <rajatm@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.813586");
  script_version("$Revision: 10558 $");
  script_cve_id("CVE-2018-14339", "CVE-2018-14344", "CVE-2018-14343", "CVE-2018-14342", 
                "CVE-2018-14341", "CVE-2018-14340", "CVE-2018-14369", "CVE-2018-14368");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-07-20 16:08:23 +0200 (Fri, 20 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-20 10:41:30 +0530 (Fri, 20 Jul 2018)");
  script_name("Wireshark Security Updates (wnpa-sec-2018-34_wnpa-sec-2018-41) Windows");

  script_tag(name: "summary" , value:"This host is installed with Wireshark
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to an,

  - Improperly sanitized MMSE dissector.

  - Improperly sanitized ISMP dissector.

  - Improperly sanitized ASN.1 BER dissector.

  - Improperly sanitized BGP dissector.

  - Improperly sanitized DICOM dissector.

  - Improperly sanitized dissectors that support zlib decompression.

  - Improperly sanitized HTTP2 protocol dissector.

  - Improperly sanitized Bazaar protocol dissector.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to inject a malformed packet causing excessive CPU resources
  consumption and denial of service.

  Impact Level: Application.");

  script_tag(name: "affected" , value: "Wireshark version 2.6.0 to 2.6.1, 2.4.0 to
  2.4.7, 2.2.0 to 2.2.15 on Windows.");

  script_tag(name: "solution" , value: "Upgrade to Wireshark version 2.6.2, 2.4.8, 2.2.16
  For updates refer to Reference links.");

  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2018-38");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2018-35");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2018-37");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2018-34");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2018-39");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2018-36");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2018-41");
  script_xref(name : "URL" , value : "https://www.wireshark.org/security/wnpa-sec-2018-40");
  script_xref(name : "URL" , value : "https://www.wireshark.org"); 

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_wireshark_detect_win.nasl");
  script_mandatory_keys("Wireshark/Win/Ver");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

if(!infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE)) exit(0);
wirversion = infos['version'];
path = infos['location'];

if(version_in_range(version:wirversion, test_version:"2.6.0", test_version2:"2.6.1")){
  fix = "2.6.2";
}

else if(version_in_range(version:wirversion, test_version:"2.4.0", test_version2:"2.4.7")){
  fix = "2.4.8";
}

else if(version_in_range(version:wirversion, test_version:"2.2.0", test_version2:"2.2.15")){
  fix = "2.2.16";
}

if(fix)
{
  report = report_fixed_ver(installed_version:wirversion, fixed_version:fix, install_path:path);
  security_message(data:report);
  exit(0);
}
exit(0);
