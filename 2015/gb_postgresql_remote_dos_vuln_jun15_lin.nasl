###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_postgresql_remote_dos_vuln_jun15_lin.nasl 49570 2015-06-24 15:34:28Z june$
#
# PostgreSQL Remote Denial Of Service Vulnerability June15 (Linux)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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

CPE = "cpe:/a:postgresql:postgresql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805805");
  script_version("$Revision: 7546 $");
  script_cve_id("CVE-2015-3165");
  script_bugtraq_id(74787);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:58:30 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2015-06-24 15:36:26 +0530 (Wed, 24 Jun 2015)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("PostgreSQL Remote Denial Of Service Vulnerability June15 (Linux)");

  script_tag(name:"summary", value:"This host is running PostgreSQL and is
  prone to remote denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Flaw is triggered when a timeout interrupt
  is fired partway through the session shutdown sequence.");

  script_tag(name:"impact", value:"Successful exploitation will allow a
  remote attacker to crash the program.

  Impact Level: Application");

  script_tag(name:"affected", value:"PostgreSQL version before 9.0.20, 9.1.x
  before 9.1.16, 9.2.x before 9.2.11, 9.3.x before 9.3.7, and 9.4.x before 9.4.2
  on Linux.");

  script_tag(name:"solution", value:"Upgrade to version 9.0.20, 9.1.16, 9.2.11,
  9.3.7, 9.4.2 or higher, For updates refer to http://www.postgresql.org/download");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.postgresql.org/about/news/1587");

  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Databases");
  script_dependencies("postgresql_detect.nasl","os_detection.nasl");
  script_require_ports("Services/postgresql", 5432);
  script_mandatory_keys("PostgreSQL/installed","Host/runs_unixoide");
  exit(0);
}


include("misc_func.inc");
include("version_func.inc");
include("host_details.inc");

## Variable Initialization
pgsqlPort = "";
pgsqlVer = "";

## Get the default port
pgsqlPort = get_app_port(cpe:CPE);
if(!pgsqlPort){
  exit(0);
}

## Get the PostgreSQL version
pgsqlVer = get_app_version(cpe:CPE, port:pgsqlPort);
if(isnull(pgsqlVer)){
  exit(0);
}

## Check for vulnerable PostgreSQL versions
if(version_is_less (version:pgsqlVer, test_version:"9.0.20") ||
   version_in_range(version:pgsqlVer, test_version:"9.1", test_version2:"9.1.15") ||
   version_in_range(version:pgsqlVer, test_version:"9.2", test_version2:"9.2.10") ||
   version_in_range(version:pgsqlVer, test_version:"9.3", test_version2:"9.3.6") ||
   version_in_range(version:pgsqlVer, test_version:"9.4", test_version2:"9.4.1"))
{
  security_message(port:pgsqlPort);
  exit(0);
}
