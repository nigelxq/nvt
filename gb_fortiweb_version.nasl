###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fortiweb_version.nasl 8030 2017-12-07 12:58:43Z teissa $
#
# FortiWeb Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105199");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version ("$Revision: 8030 $");
 script_tag(name:"last_modification", value:"$Date: 2017-12-07 13:58:43 +0100 (Thu, 07 Dec 2017) $");
 script_tag(name:"creation_date", value:"2015-02-10 17:03:19 +0100 (Tue, 10 Feb 2015)");
 script_name("FortiWeb Detection");

 script_tag(name: "summary" , value: "This script performs SSH based detection of FortiWeb");
 script_tag(name:"qod_type", value:"package");

 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("FortiOS/system_status");
 exit(0);
}


include("host_details.inc");

system = get_kb_item("FortiOS/system_status");

if( "FortiWeb" >!< system ) exit( 0 );

cpe = 'cpe:/a:fortinet:fortiweb';

model = eregmatch( string:system, pattern:'Version:(FortiWeb-[^ ]+)');

if( ! isnull( model[1] ) )
{
  mod = model[1];
  chomp(mod);
  set_kb_item( name:"fortiweb/model", value:mod);
}

vers = 'unknown';
version = eregmatch( string:system, pattern:"Version:FortiWeb-[^ ]* ([0-9.]+),");

if( ! isnull( version[1] ) )
{
  ver = version[1];
  for( i = 0; i < strlen( ver ); i++ )
  {
    if( ver[i] == "." ) continue;
    v += ver[ i ];
    if( i < ( strlen( ver ) - 1 ) ) v += '.';

  }
  set_kb_item( name:"fortiweb/version", value:v );
  cpe += ':' + v;
  vers = v;
}

build = eregmatch( string:system, pattern:',build([^,]+)' );
if( ! isnull( build[1] ) )
{
  build = ereg_replace( string:build[1], pattern:'^0', replace:"" );
  set_kb_item( name:"fortiweb/build", value:build);
}

patch = eregmatch( string:system, pattern:"Patch ([0-9]+)" );
if( ! isnull( patch[1] ) )
{
  set_kb_item( name:"fortiweb/patch", value:patch[1]);
}

register_product( cpe:cpe, location:'ssh' );

report = 'Detected FortiWeb (ssh)\n\n' +
         'Version: ' + vers + '\n';

if( mod )
  report += 'Model:   ' + mod + '\n';

if( !isnull( build ) )
  report += 'Build:   ' + build + '\n';

report += 'CPE:     ' + cpe;

log_message( port:0, data:report );

exit( 0 );

