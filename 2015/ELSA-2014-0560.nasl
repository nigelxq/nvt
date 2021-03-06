# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2014-0560.nasl 6559 2017-07-06 11:57:32Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.123408");
script_version("$Revision: 6559 $");
script_tag(name:"creation_date", value:"2015-10-06 14:03:24 +0300 (Tue, 06 Oct 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:57:32 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2014-0560");
script_tag(name: "insight", value: "ELSA-2014-0560 -  libvirt security and bug fix update - [0.10.2-29.0.1.el6_5.8]- Replace docs/et.png in tarball with blank image[0.10.2-29.el6_5.8]- LSN-2014-0003: Don't expand entities when parsing XML (CVE-2014-0179)- QoS: make tc filters match all traffic (rhbz#1096806)- use virBitmapFree instead of VIR_FREE for cpumask (rhbz#1091206)- Properly free vcpupin info for unplugged CPUs (rhbz#1091206)- sanlock: code movement in virLockManagerSanlockAcquire (rhbz#1097227)- sanlock: don't fail with unregistered domains (rhbz#1097227)- sanlock: avoid leak in acquire() (rhbz#1097227)"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2014-0560");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2014-0560.html");
script_cve_id("CVE-2014-0179");
script_tag(name:"cvss_base", value:"1.9");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:N/I:N/A:P");
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
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"libvirt", rpm:"libvirt~0.10.2~29.0.1.el6_5.8", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libvirt-client", rpm:"libvirt-client~0.10.2~29.0.1.el6_5.8", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libvirt-devel", rpm:"libvirt-devel~0.10.2~29.0.1.el6_5.8", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libvirt-python", rpm:"libvirt-python~0.10.2~29.0.1.el6_5.8", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"libvirt-lock-sanlock", rpm:"libvirt-lock-sanlock~0.10.2~29.0.1.el6_5.8", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

