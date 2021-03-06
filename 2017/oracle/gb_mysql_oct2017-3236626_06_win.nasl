###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_oct2017-3236626_06_win.nasl 7597 2017-10-27 12:23:39Z asteins $
#
# Oracle Mysql Security Updates (oct2017-3236626) 06 - Windows
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:oracle:mysql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811995");
  script_version("$Revision: 7597 $");
  script_cve_id("CVE-2017-10320", "CVE-2017-10313", "CVE-2017-10165", "CVE-2017-10311", 
		        "CVE-2017-10167" );
  script_bugtraq_id(101410, 101448, 101424, 101446, 101433);
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-27 14:23:39 +0200 (Fri, 27 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-10-18 12:59:51 +0530 (Wed, 18 Oct 2017)");
  script_name("Oracle Mysql Security Updates (oct2017-3236626) 06 - Windows");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to multiple unspecified vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,
  - An error in 'Server: InnoDB' component.

  - An error in 'Group Replication GCS' component.

  - An error in 'Server: Replication' component.

  - An error in 'Server: FTS' component.");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to compromise on availability
  confidentiality and integrity of the system.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Oracle MySQL version 
  5.7.19 and earlier on Windows.");

  script_tag(name:"solution", value:"Apply the patch from below link,
  http://www.oracle.com/technetwork/security-advisory/cpuoct2017-3236626.html");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpuoct2017-3236626.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed", "Host/runs_windows");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
mysqlVer = "";
sqlPort = "";

## Get Port
if(!sqlPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get version
if(!mysqlVer = get_app_version(cpe:CPE, port:sqlPort)){
  exit(0);
}

if(version_in_range(version:mysqlVer, test_version:"5.7", test_version2:"5.7.19"))
{
  report = report_fixed_ver(installed_version:mysqlVer, fixed_version: "Apply the patch");
  security_message(data:report, port:sqlPort);
  exit(0);
}
