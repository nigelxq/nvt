###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_smart-google-code-inserter_mult_vuln.nasl 8493 2018-01-23 06:43:13Z ckuersteiner $
#
# WordPress Smart Google Code Inserter Plugin Multiple Vulnerabilities
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

CPE = "cpe:/a:wordpress:wordpress";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112171");
  script_version("$Revision: 8493 $");
  script_tag(name: "last_modification", value: "$Date: 2018-01-23 07:43:13 +0100 (Tue, 23 Jan 2018) $");
  script_tag(name: "creation_date", value: "2018-01-02 15:18:51 +0100 (Tue, 02 Jan 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2018-3810", "CVE-2018-3811");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("WordPress Smart Google Code Inserter Plugin Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name: "summary", value: "The Smart Google Code Inserter plugin by Oturia for WordPress is prone to multiple vulnerabilities:
Authentication bypass and SQL injection.");
  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "affected", value: "WordPress Smart Google Code Inserter plugin before version 3.5");

  script_tag(name: "solution", value: "Update to version 3.5 or later.");

  script_xref(name: "URL", value: "https://limbenjamin.com/articles/smart-google-code-inserter-auth-bypass.html");
  script_xref(name: "URL", value: "https://wordpress.org/plugins/smart-google-code-inserter/#developers");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if (dir == "/")
  dir = "";

res = http_get_cache(port: port, item: dir + "/wp-content/plugins/smart-google-code-inserter/readme.txt");

if ("Smart Google Code Inserter" >< res && "Changelog" >< res) {

  vers = eregmatch(pattern: "Stable tag: ([0-9.]+)", string: res);

  if (!isnull(vers[1]) && version_is_less(version: vers[1], test_version: "3.5")) {
    report = report_fixed_ver(installed_version: vers[1], fixed_version: "3.5");
    security_message(port: port, data: report);
    exit(0);
  }
}
exit(0);
