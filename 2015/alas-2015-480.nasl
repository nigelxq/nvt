# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2015-480.nasl 6575 2017-07-06 13:42:08Z cfischer $
 
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
script_oid("1.3.6.1.4.1.25623.1.0.120324");
script_version("$Revision: 6575 $");
script_tag(name:"creation_date", value:"2015-09-08 13:23:34 +0200 (Tue, 08 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:42:08 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2015-480");
script_tag(name: "insight", value: "A flaw was found in the way the Hotspot component in OpenJDK verified bytecode from the class files. An untrusted Java application or applet could possibly use this flaw to bypass Java sandbox restrictions. (CVE-2014-6601 )Multiple improper permission check issues were discovered in the JAX-WS, and RMI components in OpenJDK. An untrusted Java application or applet could use these flaws to bypass Java sandbox restrictions. (CVE-2015-0412 , CVE-2015-0408 )A flaw was found in the way the Hotspot garbage collector handled phantom references. An untrusted Java application or applet could use this flaw to corrupt the Java Virtual Machine memory and, possibly, execute arbitrary code, bypassing Java sandbox restrictions. (CVE-2015-0395 )A flaw was found in the way the DER (Distinguished Encoding Rules) decoder in the Security component in OpenJDK handled negative length values. A specially crafted, DER-encoded input could cause a Java application to enter an infinite loop when decoded. (CVE-2015-0410 )A flaw was found in the way the SSL 3.0 protocol handled padding bytes when decrypting messages that were encrypted using block ciphers in cipher block chaining (CBC) mode. This flaw could possibly allow a man-in-the-middle (MITM) attacker to decrypt portions of the cipher text using a padding oracle attack. (CVE-2014-3566 )Note: This update disables SSL 3.0 by default to address this issue. The jdk.tls.disabledAlgorithms security property can be used to re-enable SSL 3.0 support if needed. For additional information, refer to the Red Hat Bugzilla bug linked to in the References section.It was discovered that the SSL/TLS implementation in the JSSE component in OpenJDK failed to properly check whether the ChangeCipherSpec was received during the SSL/TLS connection handshake. An MITM attacker could possibly use this flaw to force a connection to be established without encryption being enabled. (CVE-2014-6593 )An information leak flaw was found in the Swing component in OpenJDK. An untrusted Java application or applet could use this flaw to bypass certain Java sandbox restrictions. (CVE-2015-0407 )A NULL pointer dereference flaw was found in the MulticastSocket implementation in the Libraries component of OpenJDK. An untrusted Java application or applet could possibly use this flaw to bypass certain Java sandbox restrictions. (CVE-2014-6587 )Multiple boundary check flaws were found in the font parsing code in the 2D component in OpenJDK. A specially crafted font file could allow an untrusted Java application or applet to disclose portions of the Java Virtual Machine memory. (CVE-2014-6585 , CVE-2014-6591 )Multiple insecure temporary file use issues were found in the way the Hotspot component in OpenJDK created performance statistics and error log files. A local attacker could possibly make a victim using OpenJDK overwrite arbitrary files using a symlink attack. (CVE-2015-0383 )  The CVE-2015-0383  issue was discovered by Red Hat."); 
script_tag(name : "solution", value : "Run yum update java-1.6.0-openjdk to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2015-480.html");
script_cve_id("CVE-2014-3566","CVE-2015-0408","CVE-2015-0407","CVE-2014-6601","CVE-2015-0395","CVE-2015-0383","CVE-2015-0410","CVE-2014-6591","CVE-2014-6593","CVE-2014-6587","CVE-2015-0412","CVE-2014-6585");
script_tag(name:"cvss_base", value:"10.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
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
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-devel", rpm:"java-1.6.0-openjdk-devel~1.6.0.34~67.1.13.6.0.69.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-javadoc", rpm:"java-1.6.0-openjdk-javadoc~1.6.0.34~67.1.13.6.0.69.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk", rpm:"java-1.6.0-openjdk~1.6.0.34~67.1.13.6.0.69.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-demo", rpm:"java-1.6.0-openjdk-demo~1.6.0.34~67.1.13.6.0.69.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-debuginfo", rpm:"java-1.6.0-openjdk-debuginfo~1.6.0.34~67.1.13.6.0.69.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"java-1.6.0-openjdk-src", rpm:"java-1.6.0-openjdk-src~1.6.0.34~67.1.13.6.0.69.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}
