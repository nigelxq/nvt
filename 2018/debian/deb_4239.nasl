###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4239.nasl 10405 2018-07-05 05:51:36Z cfischer $
#
# Auto-generated from advisory DSA 4239-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704239");
  script_version("$Revision: 10405 $");
  script_cve_id("CVE-2018-1000528");
  script_name("Debian Security Advisory DSA 4239-1 (gosa - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-07-05 07:51:36 +0200 (Thu, 05 Jul 2018) $");
  script_tag(name:"creation_date", value:"2018-07-03 00:00:00 +0200 (Tue, 03 Jul 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4239.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9\.[0-9]+");
  script_tag(name:"affected", value:"gosa on Debian Linux");
  script_tag(name:"insight", value:"Provided is access to posix, shadow, samba, proxy, fax, pureftp and
kerberos accounts. It is able to manage the postfix/cyrus server
combination and can write user adapted sieve scripts.");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version gosa 2.7.4+reloaded2-13+deb9u1.

We recommend that you upgrade your gosa packages.

For the detailed security status of gosa please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/gosa");
  script_tag(name:"summary",  value:"Fabian Henneke discovered a cross-site scripting vulnerability in the
password change form of GOsa, a web-based LDAP administration program.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"gosa", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-desktop", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-dev", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-help-de", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-help-en", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-help-fr", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-help-nl", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-connectivity", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-dhcp", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-dhcp-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-dns", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-dns-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-fai", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-fai-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-gofax", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-gofon", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-goto", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-kolab", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-kolab-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-ldapmanager", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-mail", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-mit-krb5", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-mit-krb5-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-nagios", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-nagios-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-netatalk", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-opengroupware", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-openxchange", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-openxchange-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-opsi", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-phpgw", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-phpgw-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-phpscheduleit", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-phpscheduleit-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-pptp", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-pptp-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-pureftpd", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-pureftpd-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-rolemanagement", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-rsyslog", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-samba", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-scalix", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-squid", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-ssh", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-ssh-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-sudo", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-sudo-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-systems", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-uw-imap", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-plugin-webdav", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"gosa-schema", ver:"2.7.4+reloaded2-13+deb9u1", rls_regex:"DEB9\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
