###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_amsn_detect_win.nasl 9347 2018-04-06 06:58:53Z cfischer $
#
# aMSN Version Detection (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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

tag_summary = "This script detects the installed version of aMSN and
  sets the result in KB.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902044");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 9347 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 08:58:53 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2010-04-29 10:04:32 +0200 (Thu, 29 Apr 2010)");
  script_name("aMSN Version Detection (Windows)");
  script_tag(name:"cvss_base", value:"0.0");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Service detection");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("smb_nt.inc");
include("cpe.inc");
include("host_details.inc");

## Constant values
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.902044";
SCRIPT_DESC = "aMSN Version Detection (Windows)";

if(!get_kb_item("SMB/WindowsVersion")){
  exit(0);
}

if(!registry_key_exists(key:"SOFTWARE\AMSN-Pack")){
  exit(0);
}

# Get the version 
msnVer = registry_get_sz(key:"SOFTWARE\Affinix\AMSN-Pack", item:"Version");
if(msnVer != NULL){
  set_kb_item(name:"aMSN/Win/Ver", value:msnVer);
  log_message(data:"aMSN version " + msnVer + " was detected on the host");
      
  ## build cpe and store it as host_detail
  cpe = build_cpe(value:msnVer, exp:"^([0-9.]+)", base:"cpe:/a:amsn:amsn:");
  if(!isnull(cpe))
     register_host_detail(name:"App", value:cpe, nvt:SCRIPT_OID, desc:SCRIPT_DESC);

}
