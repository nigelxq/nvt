###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_05888dd4fe_phpldapadmin_fc26.nasl 6855 2017-08-04 13:23:41Z cfischer $
#
# Fedora Update for phpldapadmin FEDORA-2017-05888dd4fe
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.873010");
  script_version("$Revision: 6855 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-04 15:23:41 +0200 (Fri, 04 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-04 12:47:22 +0530 (Fri, 04 Aug 2017)");
  script_cve_id("CVE-2017-11107");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for phpldapadmin FEDORA-2017-05888dd4fe");
  script_tag(name: "summary", value: "Check the version of phpldapadmin");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "PhpLDAPadmin is a web-based LDAP client.
It provides easy, anywhere-accessible, multi-language administration
for your LDAP server. Its hierarchical tree-viewer and advanced search
functionality make it intuitive to browse and administer your LDAP directory.

Since it is a web application, this LDAP browser works on many platforms,
making your LDAP server easily manageable from any location.

PhpLDAPadmin is the perfect LDAP browser for the LDAP professional
and novice alike. Its user base consists mostly of LDAP administration
professionals.

Edit /etc/phpldapadmin/config.php to change default (localhost) LDAP server
location and other things. Edit /etc/httpd/conf.d/phpldapadmin.conf to allow
access by remote web-clients.
");
  script_tag(name: "affected", value: "phpldapadmin on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-05888dd4fe");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/32G6FKD3IJA6ARX774VQKNCVAH6VF4AX");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"phpldapadmin", rpm:"phpldapadmin~1.2.3~10.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
