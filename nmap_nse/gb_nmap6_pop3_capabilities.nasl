###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_pop3_capabilities.nasl 10578 2018-07-23 12:52:08Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Philip Pickering
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803547");
  script_version("$Revision: 10578 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-07-23 14:52:08 +0200 (Mon, 23 Jul 2018) $");
  script_tag(name:"creation_date", value:"2013-02-28 19:00:36 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: pop3-capabilities");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("find_service2.nasl", "nmap_nse.nasl");
  script_require_ports("Services/pop3", 110);
  script_mandatory_keys("Tools/Present/nmap", "Tools/Launch/nmap_nse");

  script_tag(name:"summary", value:"Retrieves POP3 email server capabilities.

POP3 capabilities are defined in RFC 2449. The CAPA command allows a client to ask a server what
commands it supports and possibly any site-specific policy. Besides the list of supported commands,
the IMPLEMENTATION string giving the server version may be available.");

  exit(0);
}

include("pop3_func.inc");

port = get_pop3_port(default:110);

argv = make_list("nmap", "-p", port, "--script=pop3-capabilities.nse", get_host_ip());

res = pread(cmd: "nmap", argv: argv);

if(res)
{
  foreach line (split(res))
  {
    if(ereg(pattern:"^\|",string:line)) {
      result +=  substr(chomp(line),2) + '\n';
    }

    error = eregmatch(string:line, pattern:"^nmap: (.*)$");
    if (error) {
      msg = string('Nmap command failed with following error message:\n', line);
      log_message(data : msg, port:port);
    }
  }

  if("pop3-capabilities" >< result) {
    msg = string('Result found by Nmap Security Scanner (pop3-capabilities.nse) ',
                'http://nmap.org:\n\n', result);
    log_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg, port:port);
}
