###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_db610fff5b_libxml2_fc27.nasl 8606 2018-01-31 13:07:06Z santu $
#
# Fedora Update for libxml2 FEDORA-2018-db610fff5b
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.874073");
  script_version("$Revision: 8606 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-31 14:07:06 +0100 (Wed, 31 Jan 2018) $");
  script_tag(name:"creation_date", value:"2018-01-31 07:58:38 +0100 (Wed, 31 Jan 2018)");
  script_cve_id("CVE-2017-9047", "CVE-2017-9048", "CVE-2017-9049", "CVE-2017-9050", 
                "CVE-2017-8872", "CVE-2016-4658", "CVE-2016-5131");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for libxml2 FEDORA-2018-db610fff5b");
  script_tag(name: "summary", value: "Check the version of libxml2");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "This library allows to manipulate XML 
files. It includes support to read, modify and write XML and HTML files. 
There is DTDs support this includes parsing and validation even with complex 
DtDs, either at parse time or later once the document has been modified. 
The output can be a simple SAX stream or and in-memory DOM like representations.
In this case one can use the built-in XPath and XPointer implementation to select 
sub nodes or ranges. A flexible Input/Output mechanism is available, with 
existing HTTP and FTP modules and combined to an URI library.
");
  script_tag(name: "affected", value: "libxml2 on Fedora 27");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2018-db610fff5b");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/PBWYRHEVCVJN2ELXKZBFGCVFBBOGVDL7");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
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

if(release == "FC27")
{

  if ((res = isrpmvuln(pkg:"libxml2", rpm:"libxml2~2.9.7~1.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
