###################################################################################
# OpenVAS Vulnerability Test
# $Id: gb_perl_xsloader_code_execution_vuln_win.nasl 6441 2017-06-27 09:19:17Z santu $
#
# Perl 'XSLoader Method' Code Execution Vulnerability (Windows)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:perl:perl";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809819");
  script_version("$Revision: 6441 $");
  script_cve_id("CVE-2016-6185");
  script_bugtraq_id(91685);
  script_tag(name:"cvss_base", value:"4.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-06-27 11:19:17 +0200 (Tue, 27 Jun 2017) $");
  script_tag(name:"creation_date", value:"2016-11-24 21:21:51 +0530 (Thu, 24 Nov 2016)");
  script_name("Perl 'XSLoader Method' Code Execution Vulnerability (Windows)");

  script_tag(name: "summary" , value:"This host is installed with Perl
  and is prone to code execution vulnerability.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "The flaw is due to The 'XSLoader::load'
  method in 'XSLoader' in Perl does not properly locate '.so' files when called in
  a string eval.");

  script_tag(name: "impact" , value: "Successful exploitation will allow
  local users to execute arbitrary code.

  Impact Level: Application");

  script_tag(name: "affected" , value: "Perl 5.24.0.24 and before on Windows");

  script_tag(name: "solution" , value: "Update Perl to version 5.24.1.2402 or later.
  For updates refer to https://www.perl.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL" , value:"https://www.debian.org/security/2016/dsa-3628");
  script_xref(name:"URL" , value:"http://www.openwall.com/lists/oss-security/2016/07/07/1");

  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod", value:"30");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_perl_detect_win.nasl");
  script_mandatory_keys("Perl/Strawberry_or_Active/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
perlVer = "";

## Get version
if(!perlVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less_equal(version:perlVer, test_version:"5.24.0.24"))
{
  report = report_fixed_ver(installed_version:perlVer, fixed_version:'Ask Vendor for a solution');
  security_message(data:report);
  exit(0);
}
