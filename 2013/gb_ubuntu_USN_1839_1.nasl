###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_1839_1.nasl 7958 2017-12-01 06:47:47Z santu $
#
# Ubuntu Update for linux-ti-omap4 USN-1839-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
tag_insight = "A flaw was discovered in the Linux kernel's perf_events interface. A local
  user could exploit this flaw to escalate privileges on the system.
  (CVE-2013-2094)

  Andy Lutomirski discover an error in the Linux kernel's credential handling
  on unix sockets. A local user could exploit this flaw to gain
  administrative privileges. (CVE-2013-1979)

  A buffer overflow vulnerability was discovered in the Broadcom tg3 ethernet
  driver for the Linux kernel. A local user could exploit this flaw to cause
  a denial of service (crash the system) or potentially escalate privileges
  on the system. (CVE-2013-1929)

  A flaw was discovered in the Linux kernel's ftrace subsystem interface. A
  local user could exploit this flaw to cause a denial of service (system
  crash). (CVE-2013-3301)";


tag_affected = "linux-ti-omap4 on Ubuntu 12.04 LTS";
tag_solution = "Please Install the Updated Packages.";

if(description)
{
  script_id(841446);
  script_version("$Revision: 7958 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-01 07:47:47 +0100 (Fri, 01 Dec 2017) $");
  script_tag(name:"creation_date", value:"2013-05-31 09:57:56 +0530 (Fri, 31 May 2013)");
  script_cve_id("CVE-2013-2094", "CVE-2013-1979", "CVE-2013-1929", "CVE-2013-3301");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Ubuntu Update for linux-ti-omap4 USN-1839-1");

  script_xref(name: "USN", value: "1839-1");
  script_xref(name: "URL" , value: "http://www.ubuntu.com/usn/usn-1839-1/");
  script_summary("Check for the Version of linux-ti-omap4");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
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

if(release == "UBUNTU12.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"linux-image-3.2.0-1432-omap4", ver:"3.2.0-1432.41", rls:"UBUNTU12.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
