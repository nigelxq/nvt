###############################################################################
# OpenVAS Vulnerability Test
# $Id: policy_file_checksums_violation.nasl 10530 2018-07-17 14:15:42Z asteins $
#
# List File Checksum Violations
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
#
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

# nb: Keep above the description part as it is used there
include("gos_funcs.inc");
include("version_func.inc");

# nb: includes in the description phase won't work anymore from GOS 4.2.11 (OpenVAS TBD)
# onwards so checking for the defined_func and default to TRUE below if the funcs are undefined
if( defined_func( "get_local_gos_version" ) &&
    defined_func( "version_is_greater_equal" ) ) {
  gos_version = get_local_gos_version();
  if( strlen( gos_version ) > 0 &&
      version_is_greater_equal( version:gos_version, test_version:"4.2.4" ) ) {
    use_severity = TRUE;
  } else {
    use_severity = FALSE;
  }
} else {
  use_severity = TRUE;
}

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103942");
  script_version("$Revision: 10530 $");
  script_name("File Checksums: Violations");
  if( use_severity ) {
    script_tag(name:"cvss_base", value:"10.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  } else {
    script_tag(name:"cvss_base", value:"0.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  }
  script_tag(name:"last_modification", value:"$Date: 2018-07-17 16:15:42 +0200 (Tue, 17 Jul 2018) $");
  script_tag(name:"creation_date", value:"2013-08-21 10:56:19 +0200 (Wed, 21 Aug 2013)");
  script_category(ACT_GATHER_INFO);
  script_family("Policy");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_dependencies("Policy/policy_file_checksums.nasl");
  script_mandatory_keys("policy/file_checksums/started");

  script_tag(name:"summary", value:"List files with checksum violations");

  script_tag(name:"qod", value:"98"); # direct authenticated file analysis is pretty reliable
  script_tag(name:"solution_type", value:"Mitigation");

  exit(0);
}

md5fail  = get_kb_list( "policy/file_checksums/md5_violation_list" );
sha1fail = get_kb_list( "policy/file_checksums/sha1_violation_list" );

if( md5fail || sha1fail ) {

  # Sort to not report changes on delta reports if just the order is different
  if( md5fail )  md5fail  = sort( md5fail );
  if( sha1fail ) sha1fail = sort( sha1fail );

  report  = 'The following file checksums don\'t match:\n\n';
  report += 'Filename|Result|Errorcode;\n';

  foreach fail( md5fail ) {
    report += fail + '\n';
  }
  foreach fail( sha1fail ) {
    report += fail + '\n';
  }
  if( use_severity )
    security_message( port:0, data:report );
  else
    log_message( port:0, data:report );
}

exit( 0 );
