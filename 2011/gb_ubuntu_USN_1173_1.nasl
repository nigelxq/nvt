###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1173_1.nasl 9648 2018-04-27 08:29:05Z cfischer $
#
# Ubuntu Update for freetype USN-1173-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");


if(description)
{
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-1173-1/");
  script_oid("1.3.6.1.4.1.25623.1.0.840707");
  script_version("$Revision: 9648 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-27 10:29:05 +0200 (Fri, 27 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-07-27 14:47:11 +0200 (Wed, 27 Jul 2011)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "USN", value: "1173-1");
  script_cve_id("CVE-2011-0226");
  script_name("Ubuntu Update for freetype USN-1173-1");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(10\.10|11\.04)");
  script_tag(name : "summary" , value : "Ubuntu Update for Linux kernel vulnerabilities USN-1173-1");
  script_tag(name : "affected" , value : "freetype on Ubuntu 11.04 ,
  Ubuntu 10.10");
  script_tag(name : "solution" , value : "Please Install the Updated Packages.");
  script_tag(name : "insight" , value : "It was discovered that FreeType did not correctly handle certain malformed
  Type 1 font files. If a user were tricked into using a specially crafted
  font file, a remote attacker could cause FreeType to crash or possibly
  execute arbitrary code with user privileges.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU10.10")
{

  if ((res = isdpkgvuln(pkg:"libfreetype6", ver:"2.4.2-2ubuntu0.2", rls:"UBUNTU10.10")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}


if(release == "UBUNTU11.04")
{

  if ((res = isdpkgvuln(pkg:"libfreetype6", ver:"2.4.4-1ubuntu2.1", rls:"UBUNTU11.04")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
