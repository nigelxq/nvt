# OpenVAS Vulnerability Test
# Description: Amazon Linux security check
# $Id: alas-2016-734.nasl 6574 2017-07-06 13:41:26Z cfischer $
# 
# Authors:
# Autogenerated by alas-generator developed by Eero Volotinen <eero.volotinen@iki.fi>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.120723");
script_version("$Revision: 6574 $");
script_tag(name:"creation_date", value:"2016-10-26 15:38:20 +0300 (Wed, 26 Oct 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:41:26 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2016-734");
script_tag(name: "insight", value: "Multiple flaws have been discovered in libtiff. A remote attacker could exploit these flaws to cause a crash or memory corruption and, possibly, execute arbitrary code by tricking an application linked against libtiff into processing specially crafted files. (CVE-2014-9655 , CVE-2015-1547 , CVE-2015-8784 , CVE-2015-8683 , CVE-2015-8665 , CVE-2015-8781 , CVE-2015-8782 , CVE-2015-8783 , CVE-2016-3990 , CVE-2016-5320 )"); 
script_tag(name : "solution", value : "Run yum update compat-libtiff3 to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2016-734.html");
script_cve_id("CVE-2014-9655","CVE-2016-5320","CVE-2016-3990","CVE-2015-8784","CVE-2015-8665","CVE-2015-8781","CVE-2015-8782","CVE-2015-8783","CVE-2015-1547","CVE-2015-8683");
script_tag(name:"cvss_base", value:"6.8");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
script_family("Amazon Linux Local Security Checks");
exit(0);

}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");
res = "";

if(release == NULL)
{
 exit(0);
}

if(release == "AMAZON")
{
  if ((res = isrpmvuln(pkg:"compat-libtiff3", rpm:"compat-libtiff3~3.9.4~18.14.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"compat-libtiff3-debuginfo", rpm:"compat-libtiff3-debuginfo~3.9.4~18.14.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); #Not vulnerable
    exit(0);
}
