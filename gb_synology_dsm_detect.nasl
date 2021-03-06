###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_synology_dsm_detect.nasl 10692 2018-07-31 13:51:55Z santu $
#
# Synology DiskStation Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
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
 script_oid("1.3.6.1.4.1.25623.1.0.103786");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version ("$Revision: 10692 $");
 script_tag(name:"last_modification", value:"$Date: 2018-07-31 15:51:55 +0200 (Tue, 31 Jul 2018) $");
 script_tag(name:"creation_date", value:"2013-09-12 10:58:59 +0200 (Thu, 12 Sep 2013)");
 script_tag(name:"qod_type", value:"remote_banner");
 script_name("Synology DiskStation Manager Detection");

tag_summary = "The script sends a connection request to determine if it is a Synology DiskStation";


 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80, 5000, 5001);

 script_tag(name : "summary" , value : tag_summary);

 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

port = get_http_port(default:5000);

urls = make_list('/webman/index.cgi','/index.cgi');

foreach url ( urls )
{
  req = http_get(item:url, port:port);
  buf = http_send_recv(port:port, data:req, bodyonly:FALSE);
  if(((buf =~ "Synology(&nbsp;| )DiskStation")||(buf =~ "synology.com" && 'content="DiskStation' >< buf )) && ("SYNO.SDS.Session" >< buf || '<meta name="description" content="DiskStation provides a full-featured' >< buf ))
  {
    set_kb_item(name:"synology_dsm/installed",value:TRUE);
    cpe = 'cpe:/o:synology:dsm';

    register_product(cpe:cpe, location:url, port:port);
    register_and_report_os(os:"Synology DiskStation", cpe:cpe, banner_type:"HTTP(s) Login Page", port:port, desc:"Synology DiskStation Detection", runs_key:"unixoide");
    log_message(data: 'The remote Host is a Synology DiskStation.\nLocation: ' + url + '\nCPE: cpe:/o:synology:dsm',  port:port);
    exit(0);
  }
}
exit(0);
