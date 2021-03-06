###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4151.nasl 9594 2018-04-25 02:13:41Z ckuersteiner $
#
# Auto-generated from advisory DSA 4151-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.704151");
  script_version("$Revision: 9594 $");
  script_cve_id("CVE-2018-1000140");
  script_name("Debian Security Advisory DSA 4151-1 (librelp - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-04-25 04:13:41 +0200 (Wed, 25 Apr 2018) $");
  script_tag(name:"creation_date", value:"2018-03-26 00:00:00 +0200 (Mon, 26 Mar 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4151.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB[89]\.[0-9]+");
  script_tag(name:"affected", value:"librelp on Debian Linux");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 1.2.7-2+deb8u1.

For the stable distribution (stretch), this problem has been fixed in
version 1.2.12-1+deb9u1.

We recommend that you upgrade your librelp packages.

For the detailed security status of librelp please refer to its security
tracker page at:
https://security-tracker.debian.org/tracker/librelp");
  script_tag(name:"summary",  value:"Bas van Schaik and Kevin Backhouse discovered a stack-based buffer
overflow vulnerability in librelp, a library providing reliable event
logging over the network, triggered while checking x509 certificates
from a peer. A remote attacker able to connect to rsyslog can take
advantage of this flaw for remote code execution by sending a specially
crafted x509 certificate.

Details can be found in the upstream advisory:
https://www.rsyslog.com/cve-2018-1000140/");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"librelp-dev", ver:"1.2.7-2+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"librelp0", ver:"1.2.7-2+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"librelp-dev", ver:"1.2.12-1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"librelp0", ver:"1.2.12-1+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
