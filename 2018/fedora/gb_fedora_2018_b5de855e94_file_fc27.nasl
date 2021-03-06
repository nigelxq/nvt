###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_b5de855e94_file_fc27.nasl 10371 2018-06-29 13:27:39Z santu $
#
# Fedora Update for file FEDORA-2018-b5de855e94
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
  script_oid("1.3.6.1.4.1.25623.1.0.874754");
  script_version("$Revision: 10371 $");
  script_tag(name:"last_modification", value:"$Date: 2018-06-29 15:27:39 +0200 (Fri, 29 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-29 11:00:39 +0200 (Fri, 29 Jun 2018)");
  script_cve_id("CVE-2018-10360");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for file FEDORA-2018-b5de855e94");
  script_tag(name:"summary", value:"Check the version of file");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present 
on the target host.");
  script_tag(name:"insight", value:"The file command is used to identify a particular 
file according to the type of data contained by the file.  File can identify 
many different file types, including ELF binaries, system libraries, RPM packages, 
and different graphics formats.
");
  script_tag(name:"affected", value:"file on Fedora 27");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-b5de855e94");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UPDABXIPURFX4SC3LBZH44CG2CJP26SL");
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

  if ((res = isrpmvuln(pkg:"file", rpm:"file~5.31~12.fc27", rls:"FC27")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
