###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for zarafa FEDORA-2015-5823
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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
  script_oid("1.3.6.1.4.1.25623.1.0.869303");
  script_version("$Revision: 6630 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:34:32 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-04-28 05:16:24 +0200 (Tue, 28 Apr 2015)");
  script_cve_id("CVE-2014-0103", "CVE-2014-9465");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for zarafa FEDORA-2015-5823");
  script_tag(name: "summary", value: "Check the version of zarafa");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The Zarafa Collaboration Platform is a
Microsoft Exchange replacement. The Open Source Collaboration provides an
integration with your existing Linux mail server, native mobile phone support by
ActiveSync compatibility and a webaccess with 'Look &amp  Feel' similar to
Outlook using Ajax. Including an IMAP and a POP3 gateway as well as an
iCal/CalDAV gateway, the Zarafa Open Source Collaboration can combine the
usability with the stability and the flexibility of a Linux server.

The proven Zarafa groupware solution is using MAPI objects, provides a MAPI
client library as well as programming interfaces for C++, PHP and Python.
The other Zarafa related packages need to be installed to gain all features
and benefits of the Zarafa Collaboration Platform (ZCP).
");
  script_tag(name: "affected", value: "zarafa on Fedora 21");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "FEDORA", value: "2015-5823");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2015-April/156112.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC21")
{

  if ((res = isrpmvuln(pkg:"zarafa", rpm:"zarafa~7.1.12~1.fc21", rls:"FC21")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
