###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4022883.nasl 6406 2017-06-22 10:42:26Z teissa $
#
# Microsoft Windows Kernel Information Disclosure Vulnerability (KB4022883)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.810793");
  script_version("$Revision: 6406 $");
  script_cve_id("CVE-2017-8483");
  script_bugtraq_id(98859);
  script_tag(name:"cvss_base", value:"1.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-06-22 12:42:26 +0200 (Thu, 22 Jun 2017) $");
  script_tag(name:"creation_date", value:"2017-06-14 12:53:59 +0530 (Wed, 14 Jun 2017)");
  script_name("Microsoft Windows Kernel Information Disclosure Vulnerability (KB4022883)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4022883");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists when the Windows kernel
  improperly initializes objects in memory. ");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker to
  obtain information to further compromise the users system. 

  Impact Level: System");

  script_tag(name:"affected", value:"Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4022883");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4022883");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}

include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
asVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win2008:3, win2008x64:3) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_system32root();
if(!sysPath ){
  exit(0);
}

##Fetch the version of 'Atmfd.dll'
asVer = fetch_file_version(sysPath, file_name:"Atmfd.dll");
if(!asVer){
  exit(0);
}

## Windows Server 2008
## Check for Atmfd.dll version 
if(version_is_less(version:asVer, test_version:"5.1.2.252"))
{
  report = 'File checked:     ' + sysPath + "\Atmfd.dll" + '\n' +
           'File version:     ' + asVer  + '\n' +
           'Vulnerable range: Less than 5.1.2.252\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);
