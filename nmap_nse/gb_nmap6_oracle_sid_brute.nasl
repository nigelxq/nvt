###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_oracle_sid_brute.nasl 10607 2018-07-25 09:09:12Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Patrik Karlsson
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
  script_oid("1.3.6.1.4.1.25623.1.0.803546");
  script_version("$Revision: 10607 $");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-07-25 11:09:12 +0200 (Wed, 25 Jul 2018) $");
  script_tag(name:"creation_date", value:"2013-02-28 19:00:35 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: oracle-sid-brute");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl", "oracle_tnslsnr_version.nasl");
  script_require_ports("Services/oracle_tnslsnr", 1521);
  script_mandatory_keys("Tools/Present/nmap6.01", "Tools/Launch/nmap_nse");

  script_add_preference(name:"oraclesids", value:"", type:"entry");

  script_tag(name:"summary", value:"Guesses Oracle instance/SID names against the TNS-listener.

If the 'oraclesids' script argument is not used to specify an alternate file, the default
'oracle-sids' file will be used. License to use the 'oracle-sids' file was
granted by its author, Alexander Kornbrust (http://seclists.org/nmap-dev/2009/q4/645).


SYNTAX:

oraclesids:  A file containing SIDs to try.");

  exit(0);
}

# The corresponding NSE script doesn't belong to the 'safe' category
if (safe_checks()) exit(0);

i = 0;

pref = script_get_preference("oraclesids");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'oraclesids', '=', pref, '"');
}

port = get_kb_item("Services/oracle_tnslsnr");
if(!port) port = 1521;
if(!get_port_state(port)) exit(0);

argv = make_list("nmap", "--script=oracle-sid-brute.nse","-p", port, get_host_ip());

if(i > 0)
{
  scriptArgs= "--script-args=";
  foreach arg(args) {
    scriptArgs += arg + ",";
  }
  argv = make_list(argv,scriptArgs);
}

res = pread(cmd: "nmap", argv: argv);

if(res)
{
  foreach line (split(res))
  {
    if(port = eregmatch(pattern:"^([0-9]+)/tcp",string:line))
    {
      port = port[1];
      result = NULL;
      continue;
    }

    if(ereg(pattern:"^\|",string:line)) {
      result +=  substr(chomp(line),2) + '\n';

    }

    error = eregmatch(string:line, pattern:"^nmap: (.*)$");
    if (error) {
      msg = string('Nmap command failed with following error message:\n', line);
      log_message(data : msg, port:port);
    }
  }

  if("oracle-sid-brute" >< result) {
    msg = string('Result found by Nmap Security Scanner (oracle-sid-brute.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg, port:port);
}
