###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4224.nasl 10155 2018-06-12 06:26:46Z cfischer $
#
# Auto-generated from advisory DSA 4224-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704224");
  script_version("$Revision: 10155 $");
  script_cve_id("CVE-2018-12020");
  script_name("Debian Security Advisory DSA 4224-1 (gnupg - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-06-12 08:26:46 +0200 (Tue, 12 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-08 00:00:00 +0200 (Fri, 08 Jun 2018)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4224.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"gnupg on Debian Linux");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 1.4.18-7+deb8u5.

We recommend that you upgrade your gnupg packages.

For the detailed security status of gnupg please refer to its security
tracker page at:
https://security-tracker.debian.org/tracker/gnupg");
  script_tag(name:"summary",  value:"Marcus Brinkmann discovered that GnuPG performed insufficient
sanitisation of file names displayed in status messages, which could be
abused to fake the verification status of a signed email.

Details can be found in the upstream advisory at
https://lists.gnupg.org/pipermail/gnupg-announce/2018q2/000425.html");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"gnupg", ver:"1.4.18-7+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gnupg-curl", ver:"1.4.18-7+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gpgv", ver:"1.4.18-7+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gpgv-win32", ver:"1.4.18-7+deb8u5", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
