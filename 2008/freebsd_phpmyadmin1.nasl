#
#VID 882ef43b-901f-11d9-a22c-0001020eed82
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from vuxml or freebsd advisories
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2008 E-Soft Inc. http://www.securityspace.com
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
   phpmyadmin
   phpMyAdmin

CVE-2005-0543
Cross-site scripting (XSS) vulnerability in phpMyAdmin 2.6.1 allows
remote attackers to inject arbitrary HTML and web script via (1) the
strServer, cfg[BgcolorOne], or strServerChoice parameters in
select_server.lib.php, (2) the bg_color or row_no parameters in
display_tbl_links.lib.php, the left_font_family parameter in
theme_left.css.php, or the right_font_family parameter in
theme_right.css.php.

CVE-2005-0567
Multiple PHP remote code injection vulnerabilities in phpMyAdmin 2.6.1
allow remote attackers to execute arbitrary PHP code by modifying the
(1) theme parameter to phpmyadmin.css.php or (2)
cfg[Server][extension] parameter to database_interface.lib.php to
reference a URL on a remote web server that contains the code.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

http://www.phpmyadmin.net/home_page/security.php?issue=PMASA-2005-1
http://marc.theaimsgroup.com/?l=bugtraq&m=110929725801154
http://www.vuxml.org/freebsd/882ef43b-901f-11d9-a22c-0001020eed82.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";


if(description)
{
 script_id(52161);
 script_version("$Revision: 4148 $");
 script_tag(name:"last_modification", value:"$Date: 2016-09-27 07:32:19 +0200 (Tue, 27 Sep 2016) $");
 script_tag(name:"creation_date", value:"2008-09-04 20:41:11 +0200 (Thu, 04 Sep 2008)");
 script_cve_id("CVE-2005-0543", "CVE-2005-0567");
 script_bugtraq_id(12644,12645);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("FreeBSD Ports: phpmyadmin, phpMyAdmin");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2005 E-Soft Inc. http://www.securityspace.com");
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

txt = "";
vuln = 0;
bver = portver(pkg:"phpmyadmin");
if(!isnull(bver) && revcomp(a:bver, b:"1.3.1")>0 && revcomp(a:bver, b:"2.6.1.2")<0) {
    txt += 'Package phpmyadmin version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"phpMyAdmin");
if(!isnull(bver) && revcomp(a:bver, b:"1.3.1")>0 && revcomp(a:bver, b:"2.6.1.2")<0) {
    txt += 'Package phpMyAdmin version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
