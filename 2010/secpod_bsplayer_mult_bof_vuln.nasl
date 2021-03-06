##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_bsplayer_mult_bof_vuln.nasl 8447 2018-01-17 16:12:19Z teissa $
#
# BS.Player '.bsl' File Buffer Overflow Vulnerabilities
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

tag_impact = "Successful exploitation will allow attackers to to execute
arbitrary code by tricking a user into opening a specially files. Failed
attacks will cause denial-of-service conditions.

Impact Level: Application.";

tag_affected = "BS.Global BS.Player version 2.51 Build 1022 and prior.";

tag_insight = "Multiple flaws are due to,
- A boundary error while processing specially crafted 'BSI' files, when user
opens a specially crafted 'BSI' file containing an overly long 'Skin' key
in the 'Options' section.
- A boundary error in the processing of 'ID3' tags when a user adds a specially
crafted mp3 file to the media library.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is installed BS Player and is prone to multiple buffer
overflow vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902055");
  script_version("$Revision: 8447 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-17 17:12:19 +0100 (Wed, 17 Jan 2018) $");
  script_tag(name:"creation_date", value:"2010-05-25 13:56:16 +0200 (Tue, 25 May 2010)");
  script_cve_id("CVE-2010-2004", "CVE-2010-2009");
  script_bugtraq_id(37831, 38568);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("BS.Player '.bsl' File Buffer Overflow Vulnerabilities");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/38221");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/55708");
  script_xref(name : "URL" , value : "http://www.vupen.com/english/advisories/2010/0148");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Buffer overflow");
  script_dependencies("gb_bsplayer_detect.nasl");
  script_require_keys("BSPlayer/Ver");
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}
		

include("version_func.inc");

## Get the version from KB
bsver = get_kb_item("BSPlayer/Ver");
if(!bsver){
exit(0);
}

if(bsver != NULL)
{
  ## Check for BS.Player version <= 2.51 Build 1022
  if(version_is_less_equal(version:bsver, test_version:"2.51.1022")){
    security_message(0);
  }
}
