#
#VID 16846d1e-f1de-11e1-8bd8-0022156e8794
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 16846d1e-f1de-11e1-8bd8-0022156e8794
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

include("revisions-lib.inc");
tag_insight = "The following packages are affected:
   openjdk
   linux-sun-jdk
   linux-sun-jre

CVE-2012-4681
Oracle Java 7 Update 6, and possibly other versions, allows remote
attackers to execute arbitrary code via a crafted applet, as exploited
in the wild in August 2012 using Gondzz.class and Gondvv.class.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://www.deependresearch.org/2012/08/java-7-vulnerability-analysis.html
http://mail.openjdk.java.net/pipermail/distro-pkg-dev/2012-August/020065.html
http://www.vuxml.org/freebsd/16846d1e-f1de-11e1-8bd8-0022156e8794.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.71831");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_cve_id("CVE-2012-4681");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-08-30 11:34:17 -0400 (Thu, 30 Aug 2012)");
 script_name("FreeBSD Ports: openjdk");


 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("FreeBSD Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/freebsdrel", "login/SSH/success");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-bsd.inc");
vuln = 0;
txt = "";
bver = portver(pkg:"openjdk");
if(!isnull(bver) && revcomp(a:bver, b:"7.0")>=0 && revcomp(a:bver, b:"7.6.24_1")<0) {
    txt += "Package openjdk version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}
bver = portver(pkg:"linux-sun-jdk");
if(!isnull(bver) && revcomp(a:bver, b:"7.0")>=0) {
    txt += "Package linux-sun-jdk version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}
bver = portver(pkg:"linux-sun-jre");
if(!isnull(bver) && revcomp(a:bver, b:"7.0")>=0) {
    txt += "Package linux-sun-jre version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt ));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
