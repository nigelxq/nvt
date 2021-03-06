# OpenVAS Vulnerability Test 
# Description: Mageia Linux security check 
# $Id: mgasa-2015-0248.nasl 6563 2017-07-06 12:23:47Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://www.solinor.com
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
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.130128");
script_version("$Revision: 6563 $");
script_tag(name:"creation_date", value:"2015-10-15 10:43:03 +0300 (Thu, 15 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 14:23:47 +0200 (Thu, 06 Jul 2017) $");
script_name("Mageia Linux Local Check: mgasa-2015-0248");
script_tag(name: "insight", value: "Adobe Flash Player 11.2.202.468 contains fixes to critical security vulnerabilities found in earlier versions that could cause a crash and potentially allow an attacker to take control of the affected system. Adobe is aware of reports that CVE-2015-3113 is being actively exploited in the wild via limited, targeted attacks. Systems running Internet Explorer for Windows 7 and below, as well as Firefox on Windows XP, are known targets. This update resolves a heap buffer overflow vulnerability that could lead to code execution (CVE-2015-3113). This update resolves a vulnerability (CVE-2015-3096) that could be exploited to bypass the fix for CVE-2014-5333. This update resolves vulnerabilities that could be exploited to bypass the same-origin-policy and lead to information disclosure (CVE-2015-3098, CVE-2015-3099, CVE-2015-3102). This update resolves a stack overflow vulnerability that could lead to code execution (CVE-2015-3100). This update resolves a permission issue in the Flash broker for Internet Explorer that could be exploited to perform privilege escalation from low to medium integrity level (CVE-2015-3101). This update resolves an integer overflow vulnerability that could lead to code execution (CVE-2015-3104). This update resolves a memory corruption vulnerability that could lead to code execution (CVE-2015-3105). This update resolves use-after-free vulnerabilities that could lead to code execution (CVE-2015-3103, CVE-2015-3106, CVE-2015-3107). This update resolves a memory leak vulnerability that could be used to bypass ASLR (CVE-2015-3108)."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://advisories.mageia.org/MGASA-2015-0248.html");
script_cve_id("CVE-2015-3096","CVE-2015-3098","CVE-2015-3099","CVE-2015-3100","CVE-2015-3101","CVE-2015-3102","CVE-2015-3103","CVE-2015-3104","CVE-2015-3105","CVE-2015-3106","CVE-2015-3107","CVE-2015-3108","CVE-2015-3113");
script_tag(name:"cvss_base", value:"10.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/mageia_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name : "summary", value : "Mageia Linux Local Security Checks mgasa-2015-0248");
script_copyright("Eero Volotinen");
script_family("Mageia Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "MAGEIA5")
{
if ((res = isrpmvuln(pkg:"flash-player-plugin", rpm:"flash-player-plugin~11.2.202.468~1.mga5.nonfree", rls:"MAGEIA5")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
