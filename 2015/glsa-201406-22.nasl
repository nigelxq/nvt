# OpenVAS Vulnerability Test
# Description: Gentoo Linux security check
# $Id: glsa-201406-22.nasl 9374 2018-04-06 08:58:12Z cfischer $

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
script_oid("1.3.6.1.4.1.25623.1.0.121225");
script_version("$Revision: 9374 $");
script_tag(name:"creation_date", value:"2015-09-29 11:27:25 +0300 (Tue, 29 Sep 2015)");
script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:58:12 +0200 (Fri, 06 Apr 2018) $");
script_name("Gentoo Linux Local Check: https://security.gentoo.org/glsa/201406-22");
script_tag(name: "insight", value: "Multiple vulnerabilities have been discovered in Network Audio System. Please review the CVE identifiers referenced below for details."); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://security.gentoo.org/glsa/201406-22");
script_cve_id("CVE-2013-4256","CVE-2013-4258");
script_tag(name:"cvss_base", value:"7.5");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Gentoo Linux Local Security Checks https://security.gentoo.org/glsa/201406-22");
script_copyright("Eero Volotinen");
script_family("Gentoo Local Security Checks");
exit(0);
}
include("revisions-lib.inc");

include("pkg-lib-gentoo.inc");

res = "";
report = "";

if((res=ispkgvuln(pkg:"media-libs/nas", unaffected: make_list("ge 1.9.4"), vulnerable: make_list("lt 1.9.4"))) != NULL) {

  report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
