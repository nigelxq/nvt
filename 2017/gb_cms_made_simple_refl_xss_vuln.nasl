###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cms_made_simple_refl_xss_vuln.nasl 7912 2017-11-27 06:00:54Z teissa $
#
# CMS Made Simple 2.2.2 Reflected XSS Vulnerability
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

CPE = "cpe:/a:cmsmadesimple:cms_made_simple";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112120");
  script_version("$Revision: 7912 $");
  script_tag(name: "last_modification", value: "$Date: 2017-11-27 07:00:54 +0100 (Mon, 27 Nov 2017) $");
  script_tag(name: "creation_date", value: "2017-11-13 14:05:33 +0100 (Mon, 13 Nov 2017)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_cve_id("CVE-2017-16784");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("CMS Made Simple 2.2.2 Reflected XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("cms_made_simple_detect.nasl");
  script_mandatory_keys("cmsmadesimple/installed");

  script_tag(name: "summary", value: "CMS Made Simple is prone to a reflected cross-site scripting (XSS) vulnerability.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "insight", value: "There is reflected XSS via the cntnt01detailtemplate parameter.");

  script_tag(name: "affected", value: "CMS Made Simple version 2.2.2.");

  script_tag(name: "solution", value: "Upgrade to version 2.2.3 or later. For updates refer to: https://www.cmsmadesimple.org/");

  script_xref(name: "URL", value: "https://www.netsparker.com/web-applications-advisories/ns-17-031-reflected-xss-vulnerability-in-cms-made-simple/");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_equal(version: version, test_version: "2.2.2")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.2.3");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
