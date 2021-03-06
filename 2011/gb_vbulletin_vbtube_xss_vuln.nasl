###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vbulletin_vbtube_xss_vuln.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# vBulletin vBTube Multiple Cross-Site Scripting Vulnerabilities
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attacker to execute arbitrary
HTML and script code in a user's browser session in context of an affected site.
Impact Level: Application";

tag_affected = "vBulletin vBTube version 1.2.9";

tag_insight = "Multiple flaws are caused by improper validation of user-supplied
input passed via 'uname' and 'vidid'  parameters in vBTube.php, which allows
attackers to execute arbitrary HTML and script code on the web server.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is running vBulletin vBTube and is prone to multiple
cross site scripting vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802209");
  script_version("$Revision: 9351 $");
  script_bugtraq_id(48280);
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-06-17 11:16:31 +0200 (Fri, 17 Jun 2011)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("vBulletin vBTube Multiple Cross-Site Scripting Vulnerabilities");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/68060");
  script_xref(name : "URL" , value : "http://www.vbulletin.org/forum/showthread.php?t=173083");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/view/102238/vbtube129-xss.txt");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("vbulletin_detect.nasl");
  script_require_ports("Services/www", 80);
  script_require_keys("vBulletin/installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("http_func.inc");
include("version_func.inc");
include("http_keepalive.inc");

## Get HTTP Port
port = get_http_port(default:80);
if(!port){
  exit(0);
}

## Check Host Supports PHP
if(!can_host_php(port:port)){
  exit(0);
}

## Get vBulletin Location
if(! dir = get_dir_from_kb(port:port, app:"vBulletin")){
  exit(0);
}

## Construct attack request
url = string(dir, '/vBTube.php?page=1&do=user&uname="><script>alert(/openvas',
                  '-xss-test/);</script>');

## Try XSS and check the response to confirm vulnerability
if(http_vuln_check(port:port, url:url, check_header: TRUE,
   pattern:"><script>alert\(/openvas-xss-test/\);</script>")){
  security_message(port);
}
