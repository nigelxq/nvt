###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_2065_1.nasl 7957 2017-12-01 06:40:08Z santu $
#
# Ubuntu Update for linux-ec2 USN-2065-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_id(841675);
  script_version("$Revision: 7957 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-01 07:40:08 +0100 (Fri, 01 Dec 2017) $");
  script_tag(name:"creation_date", value:"2014-01-06 16:02:41 +0530 (Mon, 06 Jan 2014)");
  script_cve_id("CVE-2013-4345", "CVE-2013-4588", "CVE-2013-6378", "CVE-2013-6763");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux-ec2 USN-2065-1");

  tag_insight = "Stephan Mueller reported an error in the Linux kernel's ansi cprng random
number generator. This flaw makes it easier for a local attacker to break
cryptographic protections. (CVE-2013-4345)

A flaw was discovered in the Linux kernel's IP Virtual Server (IP_VS)
support. A local user with the CAP_NET_ADMIN capability could exploit this
flaw to gain additional administrative privileges. (CVE-2013-4588)

Nico Golde and Fabian Yamaguchi reported a flaw in the Linux kernel's
debugfs filesystem. An administrative local user could exploit this flaw to
cause a denial of service (OOPS). (CVE-2013-6378)

Nico Golde reported a flaw in the Linux kernel's userspace IO (uio) driver.
A local user could exploit this flaw to cause a denial of service (memory
corruption) or possibly gain privileges. (CVE-2013-6763)";

  tag_affected = "linux-ec2 on Ubuntu 10.04 LTS";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "USN", value: "2065-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-2065-1/");
  script_summary("Check for the Version of linux-ec2");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  exit(0);
}


include("pkg-lib-deb.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "UBUNTU10.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-2.6.32-360-ec2", ver:"2.6.32-360.73", rls:"UBUNTU10.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}