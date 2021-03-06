##############################################################################
# OpenVAS Vulnerability Test
# $Id: nopsec_php_5_3_6.nasl 4506 2016-11-14 15:24:24Z cfi $
#
# PHP Version 5.3 < 5.3.6 Multiple Vulnerabilities
#
# Authors:
# Songhan Yu <syu@nopsec.com>
#
# Copyright:
# Copyright NopSec Inc. 2012, http://www.nopsec.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.110013");
  script_version("$Revision: 4506 $");
  script_tag(name:"last_modification", value:"$Date: 2016-11-14 16:24:24 +0100 (Mon, 14 Nov 2016) $");
  script_tag(name:"creation_date", value:"2012-06-14 13:15:22 +0200 (Thu, 14 Jun 2012)");
  script_tag(name:"cvss_base", value:"7.5");
  script_cve_id("CVE-2011-0421", "CVE-2011-0708", "CVE-2011-1092", "CVE-2011-1153", "CVE-2011-1464", "CVE-2011-1466", "CVE-2011-1467", "CVE-2011-1468", "CVE-2011-1469", "CVE-2011-1470");
  script_bugtraq_id(46354, 46365, 46786, 46854);
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("PHP Version 5.3 < 5.3.6 Multiple Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("Copyright NopSec Inc. 2012");
  script_dependencies("gb_php_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("php/installed");

  tag_summary = "PHP version < 5.3.6 suffers multiple vulnerabilities such as integer overflow vulnerability,
  buffer overflow error and several casting errors.";

  tag_solution = "Upgrade PHP to 5.3.6 or later versions.";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( port = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_in_range( version:vers, test_version:"5.3", test_version2:"5.3.5" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"5.3.6" );
  security_message( data:report, port:port );
  exit( 0 );
}

exit( 99 );