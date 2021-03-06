###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for perl FEDORA-2016-5
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
  script_oid("1.3.6.1.4.1.25623.1.0.807461");
  script_version("$Revision: 6631 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:36:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-03-04 06:42:13 +0100 (Fri, 04 Mar 2016)");
  script_cve_id("CVE-2016-2381");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for perl FEDORA-2016-5");
  script_tag(name: "summary", value: "Check the version of perl");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "Perl is a high-level programming language
  with roots in C, sed, awk and shell scripting.  Perl is good at handling
  processes and files, and is especially good at handling text.  Perl's
  hallmarks are practicality and efficiency. While it is used to do a lot of
  different things, Perl's most common applications are system administration
  utilities and web programming.

  Install this package if you want to program in Perl or enable your system to
  handle Perl scripts with /usr/bin/perl interpreter.

  If your script requires some Perl modules, you can install them with
  'perl(MODULE)' where 'MODULE' is a name of required module. E.g. install
  'perl(Test::More)' to make Test::More Perl module available.

  If you need all the Perl modules that come with upstream Perl sources, so
  called core modules, install perl-core package.

  If you only need perl run-time as a shared library, i.e. Perl interpreter
  embedded into another application, the only essential package is perl-libs.

  Perl header files can be found in perl-devel package.");

  script_tag(name: "affected", value: "perl on Fedora 23");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-5");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2016-March/178357.html");
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

  if ((res = isrpmvuln(pkg:"perl", rpm:"perl~5.22.1~351.fc23", rls:"FC23")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
