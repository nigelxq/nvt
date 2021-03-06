###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vtiger_crm_dir_trav_vuln_aug14.nasl 5933 2017-04-11 10:42:30Z cfi $
#
# vTiger CRM 'file' Arbitrary File Disclosure Vulnerability
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:vtiger:vtiger_crm";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804748");
  script_version("$Revision: 5933 $");
  script_cve_id("CVE-2014-1222");
  script_bugtraq_id(66136);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"last_modification", value:"$Date: 2017-04-11 12:42:30 +0200 (Tue, 11 Apr 2017) $");
  script_tag(name:"creation_date", value:"2014-08-25 15:26:37 +0530 (Mon, 25 Aug 2014)");
  script_name("vTiger CRM 'file' Arbitrary File Disclosure Vulnerability");

  tag_summary =
"This host is installed with Vtiger CRM and is prone to arbitrary file
disclosure vulnerability";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Flaw is due to the /kcfinder/browse.php script not properly sanitizing user
input, specifically path traversal style attacks (e.g. '../') supplied
via the 'file' parameter.";

  tag_impact =
"Successful exploitation will allow an authenticated remote attacker to gain
access to arbitrary files.

Impact Level: Application";

  tag_affected =
"Vtiger CRM version 6.0.0 and prior";

  tag_solution =
"Apply the patch Vtiger CRM 6.0.0 Security patch 1 from the below link,
http://softlayer-sng.dl.sourceforge.net/project/vtigercrm/vtiger%20CRM%206.0.0/Add-ons/vtigercrm-600-security-patch1.zip
or Upgrade to the latest version, For updates refer to https://www.vtiger.com

*****
NOTE: Ignore this warning, if above mentioned patch is manually applied.
*****";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);

  script_xref(name : "URL" , value : "http://secunia.com/advisories/57149");
  script_xref(name : "URL" , value : "http://packetstormsecurity.com/files/125685");
  script_xref(name : "URL" , value : "https://www.portcullis-security.com/security-research-and-downloads/security-advisories/cve-2014-1222");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("gb_vtiger_crm_detect.nasl");
  script_mandatory_keys("vtiger/installed");
  script_require_ports("Services/www", 80, 8888);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");
include("global_settings.inc");

## Variable Initialization
vtVer = "";
http_port = "";

## Get HTTP Port
if(!http_port = get_app_port(cpe:CPE)){
  exit(0);
}

## Get version
if(!vtVer = get_app_version(cpe:CPE, port:http_port)){
  exit(0);
}

# Check for vulnerable version
if(version_is_less_equal(version:vtVer, test_version:"6.0.0"))
{
  security_message(port:http_port);
  exit(0);
}
