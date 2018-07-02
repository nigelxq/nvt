###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_M5_072.nasl 9365 2018-04-06 07:34:21Z cfischer $
#
# IT-Grundschutz, 14. EL, Ma�nahme 5.072
#
# Authors:
# Thomas Rotter <thomas.rotter@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.95068");
  script_version("$Revision: 9365 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:34:21 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2015-03-25 10:14:11 +0100 (Wed, 25 Mar 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"qod_type", value:"remote_active");
  script_name("IT-Grundschutz M5.072: Deaktivieren nicht ben�tigter Netzdienste");
  script_xref(name : "URL" , value : "http://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKataloge/Inhalt/_content/m/m05/m05072.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2015 Greenbone Networks GmbH");
  script_family("IT-Grundschutz-15");
  script_mandatory_keys("Compliance/Launch/GSHB-15");
  script_dependencies("GSHB/GSHB_WMI_Netstat_natcp.nasl", "GSHB/GSHB_SSH_netstat.nasl", "smb_nativelanman.nasl");
  script_tag(name : "summary" , value :
"IT-Grundschutz M5.072: Deaktivieren nicht ben�tigter Netzdienste.

Stand: 14. Erg�nzungslieferung (14. EL).

Hinweis:
Lediglich Anzeige der in Frage kommenden Dienste.
");

  exit(0);
}

include("itg.inc");

name = 'IT-Grundschutz M5.072: Deaktivieren nicht ben�tigter Netzdienste\n';

gshbm =  "GSHB Ma�nahme 5.072: ";

WMINetstat = get_kb_item("GSHB/WMI/NETSTAT");
SSHNetstat = get_kb_item("GSHB/SSH/NETSTAT");
lanman = get_kb_item("SMB/NativeLanManager");

if("windows" >!< tolower(lanman) && SSHNetstat >< "nosock"){
  result = string("Fehler");
   desc = string('Beim Testen des Systems wurde festgestellt, dass keine\nSSH Verbindung aufgebaut werden konnte.');

}else if("windows" >!< tolower(lanman) && SSHNetstat >!< "nosock"){
  if (SSHNetstat >!< "none"){
    result = string("unvollst�ndig");
    desc = string('Bitte pr�fen Sie das Ergebnis und deaktivieren ggf. nicht\nben�tigter Netzdienste:\n\n' + SSHNetstat);
  }else if (SSHNetstat >< "none"){
    result = string("Fehler");
    desc = string('Es konnte �ber "netstat" kein Ergebnis ermittelt werden.');
  }
}else if("windows" >< tolower(lanman)){
  if(WMINetstat >< "nocred"){
    result = string("Fehler");
    desc = string('Beim Testen des Systems wurde festgestellt,\ndass keine Logindaten angegeben wurden.');
  }else if(WMINetstat >< "toold"){
    result = string("Fehler");
    desc = string('Ihre OpenVAS - GSM Installation ist zu alt.');
  }else if(WMINetstat >!< ""){
    result = string("unvollst�ndig");
    desc = string('Bitte pr�fen Sie das Ergebnis, und deaktivieren ggf.\nnicht ben�tigter Netzdienste:\n\n' + WMINetstat);
  }
}

if (!result){
  result = string("Fehler");
  desc = string('Beim Testen des Systems trat ein unbekannter Fehler auf\nbzw. es konnte kein Ergebnis ermittelt werden.');
}

set_kb_item(name:"GSHB/M5_072/result", value:result);
set_kb_item(name:"GSHB/M5_072/desc", value:desc);
set_kb_item(name:"GSHB/M5_072/name", value:name);

silence = get_kb_item("GSHB/silence");
if (!silence) itg_send_details (itg_id: 'GSHB/M5_072');

exit(0);
           
