###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fortiweb_xss_vuln.nasl 9415 2018-04-10 06:55:50Z cfischer $
#
# FortiWeb Multiple Reflected Cross Site Scripting Vulnerabilities - June 2015
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:fortinet:fortiweb";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805645");
  script_version("$Revision: 9415 $");
  script_cve_id("CVE-2014-8619");
  script_bugtraq_id(74679);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-04-10 08:55:50 +0200 (Tue, 10 Apr 2018) $");
  script_tag(name:"creation_date", value:"2015-06-08 11:54:11 +0530 (Mon, 08 Jun 2015)");
  script_tag(name:"qod_type", value:"package");
  script_name("FortiWeb Multiple Reflected Cross Site Scripting Vulnerabilities - June 2015");

  script_tag(name:"summary", value:"This host is installed with Fortinet
  FortiWeb and is prone to multiple reflected cross-site scripting
  vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to the
  the autolearn configuration page does not validate input before returning it
  to users.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  a context-dependent attacker to create a specially crafted request that would
  execute arbitrary script code in a user's browser session within the trust
  relationship between their browser and the server.

  Impact Level: Application");

  script_tag(name:"affected", value:"Fortinet FortiWeb versions 5.1.2 through
  5.3.4.");

  script_tag(name:"solution", value:"Upgrade to Fortinet FortiWeb 5.3.5 or
  later. For updates refer to http://www.fortinet.com");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://fortiguard.com/psirt/FG-IR-15-005");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("FortiOS Local Security Checks");
  script_dependencies("gb_fortiweb_version.nasl");
  script_mandatory_keys("fortiweb/version");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
fwebVer = "";

## Get version
if(!fwebVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Checking for Vulnerable version
if(version_in_range(version:fwebVer, test_version:"5.1.2", test_version2:"5.3.4"))
{
  report = 'Installed version: ' + fwebVer + '\n' +
           'Fixed version:     ' + "5.3.5" + '\n';
  security_message(data:report);
  exit(0);
}
