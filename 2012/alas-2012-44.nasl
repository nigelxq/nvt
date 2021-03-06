# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2012-44.nasl 6578 2017-07-06 13:44:33Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@iki.fi> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://ping-viini.org 
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
script_oid("1.3.6.1.4.1.25623.1.0.120251");
script_version("$Revision: 6578 $");
script_tag(name:"creation_date", value:"2015-09-08 13:21:28 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:44:33 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2012-44");
script_tag(name: "insight", value: "This update fixes several vulnerabilities in the MySQL database server. Information about these flaws can be found on the Oracle Critical Patch Update Advisory page, listed in the References section. (CVE-2011-2262 , CVE-2012-0075 , CVE-2012-0087 , CVE-2012-0101 , CVE-2012-0102 , CVE-2012-0112 , CVE-2012-0113 , CVE-2012-0114 , CVE-2012-0115 , CVE-2012-0116 , CVE-2012-0118 , CVE-2012-0119 , CVE-2012-0120 , CVE-2012-0484 , CVE-2012-0485 , CVE-2012-0490 , CVE-2012-0492 )These updated packages upgrade MySQL to version 5.1.61. Refer to the MySQL release notes for a full list of changes:"); 
script_tag(name : "solution", value : "Run yum update mysql to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2012-44.html");
script_cve_id("CVE-2012-0118", "CVE-2012-0119", "CVE-2012-0114", "CVE-2012-0115", "CVE-2012-0116", "CVE-2012-0112", "CVE-2012-0113", "CVE-2012-0484", "CVE-2012-0485", "CVE-2012-0490", "CVE-2012-0075", "CVE-2012-0492", "CVE-2012-0087", "CVE-2012-0101", "CVE-2011-2262", "CVE-2012-0120");
script_tag(name:"cvss_base", value:"5.5");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("Eero Volotinen");
script_family("Amazon Linux Local Security Checks");
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
if(release == "AMAZON")
{
if ((res = isrpmvuln(pkg:"mysql-embedded-devel", rpm:"mysql-embedded-devel~5.1.61~1.27.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql-test", rpm:"mysql-test~5.1.61~1.27.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql-debuginfo", rpm:"mysql-debuginfo~5.1.61~1.27.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql-embedded", rpm:"mysql-embedded~5.1.61~1.27.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql-libs", rpm:"mysql-libs~5.1.61~1.27.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql-server", rpm:"mysql-server~5.1.61~1.27.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql-bench", rpm:"mysql-bench~5.1.61~1.27.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql", rpm:"mysql~5.1.61~1.27.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mysql-devel", rpm:"mysql-devel~5.1.61~1.27.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
