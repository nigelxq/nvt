# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2013-193.nasl 6577 2017-07-06 13:43:46Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120096");
script_version("$Revision: 6577 $");
script_tag(name:"creation_date", value:"2015-09-08 13:17:19 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:43:46 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: ALAS-2013-193");
script_tag(name: "insight", value: "Cross-site scripting (XSS) flaws were found in the mod_proxy_balancer module's manager web interface. If a remote attacker could trick a user, who was logged into the manager web interface, into visiting a specially-crafted URL, it would lead to arbitrary web script execution in the context of the user's manager interface session. (CVE-2012-4558 )It was found that mod_rewrite did not filter terminal escape sequences from its log file. If mod_rewrite was configured with the RewriteLog directive, a remote attacker could use specially-crafted HTTP requests to inject terminal escape sequences into the mod_rewrite log file. If a victim viewed the log file with a terminal emulator, it could result in arbitrary command execution with the privileges of that user. (CVE-2013-1862 )Cross-site scripting (XSS) flaws were found in the mod_info, mod_status, mod_imagemap, mod_ldap, and mod_proxy_ftp modules. An attacker could possibly use these flaws to perform XSS attacks if they were able to make the victim's browser generate an HTTP request with a specially-crafted Host header. (CVE-2012-3499 )"); 
script_tag(name : "solution", value : "Run yum update httpd to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2013-193.html");
script_cve_id("CVE-2012-4558", "CVE-2013-1862", "CVE-2012-3499");
script_tag(name:"cvss_base", value:"5.1");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:P");
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
if ((res = isrpmvuln(pkg:"httpd-debuginfo", rpm:"httpd-debuginfo~2.2.24~2.31.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"httpd", rpm:"httpd~2.2.24~2.31.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"mod_ssl", rpm:"mod_ssl~2.2.24~2.31.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"httpd-tools", rpm:"httpd-tools~2.2.24~2.31.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"httpd-manual", rpm:"httpd-manual~2.2.24~2.31.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
