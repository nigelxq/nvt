###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_trillian_msn_auth_ssl_cert_sec_bypass_vuln.nasl 8254 2017-12-28 07:29:05Z teissa $
#
# Trillian MSN SSL Certificate Validation Security Bypass Vulnerability
#
# Authors:
# Veerendra GG <veerendragg@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
###############################################################################

tag_solution = "Upgrade to Cerulean Studios Trillian version 4.2 or later
  For more info refer, http://www.trillian.im/

  NOTE: Ignore this warning, if it's Trillian Pro Edition";

tag_impact = "Successful exploitation will allow attackers to perform man-in-the-middle
  attacks.
  Impact Level: Application";
tag_affected = "Cerulean Studios Trillian 3.1 Basic on windows.";
tag_insight = "The flaw is due to improper varification of SSL certificate before
  sending MSN user credentials.";
tag_summary = "This host is installed with Trillian and is prone to security bypass
  vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800177");
  script_version("$Revision: 8254 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-28 08:29:05 +0100 (Thu, 28 Dec 2017) $");
  script_tag(name:"creation_date", value:"2010-05-05 15:59:12 +0200 (Wed, 05 May 2010)");
  script_bugtraq_id(35509);
  script_cve_id("CVE-2009-4831");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_name("Trillian MSN SSL Certificate Validation Security Bypass Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/35620");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/51400");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_trillian_detect.nasl");
  script_require_keys("Trillian/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  exit(0);
}


include("version_func.inc");

trillianVer = get_kb_item("Trillian/Ver");
if(!trillianVer){
  exit(0);
}

## Grep for Trillian version 3.1 to 3.1.14.0
if(version_in_range(version:trillianVer, test_version:"3.1",
                                         test_version2:"3.1.14.0")){
  security_message(0);
}
