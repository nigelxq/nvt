###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4234.nasl 10309 2018-06-25 06:18:28Z cfischer $
#
# Auto-generated from advisory DSA 4234-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704234");
  script_version("$Revision: 10309 $");
  script_cve_id("CVE-2018-12564", "CVE-2018-12565");
  script_name("Debian Security Advisory DSA 4234-1 (lava-server - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-06-25 08:18:28 +0200 (Mon, 25 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-22 00:00:00 +0200 (Fri, 22 Jun 2018)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4234.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"lava-server on Debian Linux");
  script_tag(name:"insight", value:"LAVA is a continuous integration system for deploying operating
systems onto physical and virtual hardware for running tests.
Tests can be simple boot testing, bootloader testing and system
level testing. Extra hardware may be required for some
system tests. Results are tracked over time and data can be
exported for further analysis.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 2016.12-3.

We recommend that you upgrade your lava-server packages.

For the detailed security status of lava-server please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/lava-server");
  script_tag(name:"summary",  value:"Two vulnerabilities were discovered in LAVA, a continuous integration
system for deploying operating systems for running tests, which could
result in information disclosure of files readable by the lavaserver
system user or the execution of arbitrary code via a XMLRPC call.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"lava", ver:"2016.12-3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"lava-dev", ver:"2016.12-3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"lava-server", ver:"2016.12-3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"lava-server-doc", ver:"2016.12-3", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
