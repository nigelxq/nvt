###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_denial_of_service_nov14.nasl 10456 2018-07-09 06:10:17Z cfischer $
#
# PHP 'donate' function Denial of Service Vulnerability - Nov14
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:php:php";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804884");
  script_version("$Revision: 10456 $");
  script_cve_id("CVE-2014-3710");
  script_bugtraq_id(70807);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-07-09 08:10:17 +0200 (Mon, 09 Jul 2018) $");
  script_tag(name:"creation_date", value:"2014-11-17 12:25:37 +0530 (Mon, 17 Nov 2014)");
  script_name("PHP 'donate' function Denial of Service Vulnerability - Nov14");

  script_tag(name:"summary", value:"This host is installed with PHP and is
  prone to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The flaw is due to an out-of-bounds
  read error in the 'donote' function in readelf.c script.");

  script_tag(name:"impact", value:"Successful exploitation will allow a local
  attacker to conduct a denial of service attack.

  Impact Level: Application");

  script_tag(name:"affected", value:"PHP versions 5.4.x before 5.4.35,
  5.5.x before 5.5.19 and 5.6.x before 5.6.3");

  script_tag(name:"solution", value:"Upgrade to PHP version 5.4.35 or 5.5.19
  or 5.6.3 or later");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"http://php.net/ChangeLog-5.php");
  script_xref(name:"URL", value:"https://bugs.php.net/bug.php?id=68283");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/98385");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_php_detect.nasl");
  script_mandatory_keys("php/installed");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( phpPort = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! phpVer = get_app_version( cpe:CPE, port:phpPort ) ) exit( 0 );

if(phpVer =~ "^5\.[4-6]"){
  if(version_in_range(version:phpVer, test_version:"5.4.0", test_version2:"5.4.34")||
     version_in_range(version:phpVer, test_version:"5.5.0", test_version2:"5.5.18")||
     version_in_range(version:phpVer, test_version:"5.6.0", test_version2:"5.6.2")){
    report = report_fixed_ver(installed_version:phpVer, fixed_version:"5.4.35/5.5.19/5.6.3");
    security_message(data:report, port:phpPort);
    exit(0);
  }
}

exit(99);
