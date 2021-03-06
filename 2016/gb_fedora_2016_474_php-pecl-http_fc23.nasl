###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for php-pecl-http FEDORA-2016-474
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.807738");
  script_version("$Revision: 6631 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:36:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-03-25 06:13:06 +0100 (Fri, 25 Mar 2016)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for php-pecl-http FEDORA-2016-474");
  script_tag(name: "summary", value: "Check the version of php-pecl-http");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "The HTTP extension aims to provide a
  convenient and powerful set of functionality for major applications.

  The HTTP extension eases handling of HTTP URLs, dates, redirects, headers
  and messages in a HTTP context (both incoming and outgoing). It also provides
  means for client negotiation of preferred language and charset, as well as
  a convenient way to exchange arbitrary data with caching and resuming
  capabilities.

  Also provided is a powerful request and parallel interface.

  Version 2 is completely incompatible to previous version.

  Note:
  . php-pecl-http1 provides API version 1
  . php-pecl-http  provides API version 2
  
  Documentation : <A HREF='http://devel-m6w6.rhcloud.com/mdref/http'>
  http://devel-m6w6.rhcloud.com/mdref/http</A>");

  script_tag(name: "affected", value: "php-pecl-http on Fedora 23");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-474");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2016-March/179321.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(release == "FC23")
{

  if ((res = isrpmvuln(pkg:"php-pecl-http", rpm:"php-pecl-http~2.5.6~1.fc23", rls:"FC23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
