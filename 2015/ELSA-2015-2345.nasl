# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2015-2345.nasl 6560 2017-07-06 11:58:38Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
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
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.122757");
script_version("$Revision: 6560 $");
script_tag(name:"creation_date", value:"2015-11-24 10:17:30 +0200 (Tue, 24 Nov 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:58:38 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2015-2345");
script_tag(name: "insight", value: "ELSA-2015-2345 -  net-snmp security and bug fix update - [1:5.7.2-24]- Fixed lmSensorsTable not reporting sensors with duplicate names (#1252053)- Fixed close() overhead of extend commands (#1252048)- Fixed out-of-bounds write in python code (#1252034)[1:5.7.2-23]- Fixed parsing of invalid variables in incoming packets (#1248414)- Fixed HOST-RESOURCES-MIB::hrFSAccess flag when read-only filesystem becomes writable (#1241897)[1:5.7.2-22]- Fixed IP-MIB::ipSystemStatsInOctets and similar counters for IPv4 (#1235697)[1:5.7.2-21]- Fixed crash on reloading 'exec' configuration options (#1228893)- Fixed CVE-2014-3565, snmptrapd died when parsing certain traps (#1209361)- Fixed storageUseNFS functionality in hrStorageTable (#1193006)- Fixed forwarding of traps with RequestID=0 in snmptrapd (#1192511)- Fixed hrStorageTable to contain 31 bits integers (#1192221)- Fixed 'clientaddr' option for UDPv6 client messages (#1190679)- Fixed log level of SMUX messages (#1189393)- Fixed UDP-MIB::udpTable index on big-endian platforms (#1184433)- Fixed client utilities reporting 'read_config_store open failure on /var/lib/net-snmp/snmpapp.conf' (#1151310)- Fixed snmpd crash when failed to parse SMUX message headers (#1140236)- Added 'diskio' option to snmpd.conf, it's possible to monitor only selected devices in diskIOTable (#1092308)"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2015-2345");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2015-2345.html");
script_cve_id("CVE-2014-3565");
script_tag(name:"cvss_base", value:"5.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_copyright("Eero Volotinen");
script_family("Oracle Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "OracleLinux7")
{
  if ((res = isrpmvuln(pkg:"net-snmp", rpm:"net-snmp~5.7.2~24.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"net-snmp-agent-libs", rpm:"net-snmp-agent-libs~5.7.2~24.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"net-snmp-devel", rpm:"net-snmp-devel~5.7.2~24.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"net-snmp-gui", rpm:"net-snmp-gui~5.7.2~24.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"net-snmp-libs", rpm:"net-snmp-libs~5.7.2~24.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"net-snmp-perl", rpm:"net-snmp-perl~5.7.2~24.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"net-snmp-python", rpm:"net-snmp-python~5.7.2~24.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"net-snmp-sysvinit", rpm:"net-snmp-sysvinit~5.7.2~24.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"net-snmp-utils", rpm:"net-snmp-utils~5.7.2~24.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);

