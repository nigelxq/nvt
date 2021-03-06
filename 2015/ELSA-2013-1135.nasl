# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2013-1135.nasl 6558 2017-07-06 11:56:55Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
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
script_oid("1.3.6.1.4.1.25623.1.0.123588");
script_version("$Revision: 6558 $");
script_tag(name:"creation_date", value:"2015-10-06 14:05:55 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:56:55 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2013-1135");
script_tag(name: "insight", value: "ELSA-2013-1135 -  nss and nspr security, bug fix, and enhancement update - nspr[4.9.2-4]- Resolves: rhbz#924741 - Rebase to nspr-4.9.5nss[3.14.3-6]- Resolves: rhbz#986969 - nssutil_ReadSecmodDB() leaks memory[3.14.3-5]- Define -DNO_FORK_CHECK when compiling softoken for ABI compatibility- Remove the unused and obsolete nss-nochktest.patch- Resolves: rhbz#949845 - [RFE][RHEL5] Rebase to nss-3.14.3 to fix the lucky-13 issue[3.14.3-4]- Fix rpmdiff test reported failures and remove other unwanted changes- Resolves: rhbz#949845 - [RFE][RHEL5] Rebase to nss-3.14.3 to fix the lucky-13 issue[3.14.3-3]- Update to NSS_3_14_3_RTM- Rework the rebase to preserve needed idiosynchracies- Ensure we install frebl/softoken from the extra build tree- Don't include freebl static library or its private headers- Add patch to deal with system sqlite not being recent enough- Don't install nss-sysinit nor sharedb- Resolves: rhbz#949845 - [RFE][RHEL5] Rebase to nss-3.14.3 to fix the lucky-13 issue[3.14.3-2]- Restore the freebl-softoken source tar ball updated to 3.14.3- Renumbering of some sources for clarity- Resolves: rhbz#918870 - [RFE][RHEL5] Rebase to nss-3.14.3 to fix the lucky-13 issue[3.14.3-1]- Update to NSS_3_14_3_RTM- Resolves: rhbz#918870 - [RFE][RHEL5] Rebase to nss-3.14.3 to fix the lucky-13 issue"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2013-1135");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2013-1135.html");
script_cve_id("CVE-2013-0791","CVE-2013-1620");
script_tag(name:"cvss_base", value:"5.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_copyright("Eero Volotinen");
script_family("Oracle Linux Local Security Checks");
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
if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"nspr", rpm:"nspr~4.9.5~1.el5_9", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nspr-devel", rpm:"nspr-devel~4.9.5~1.el5_9", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss", rpm:"nss~3.14.3~6.el5_9", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-devel", rpm:"nss-devel~3.14.3~6.el5_9", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-pkcs11-devel", rpm:"nss-pkcs11-devel~3.14.3~6.el5_9", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"nss-tools", rpm:"nss-tools~3.14.3~6.el5_9", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

