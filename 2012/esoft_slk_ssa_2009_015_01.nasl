# OpenVAS Vulnerability Test
# $Id: esoft_slk_ssa_2009_015_01.nasl 8649 2018-02-03 12:16:43Z teissa $
# Description: Auto-generated from the corresponding slackware advisory
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

include("revisions-lib.inc");
tag_insight = "Updated bind packages are available for Slackware 10.2 and 11.0 to address a
load problem.  It was reported that the initial build of these updates
complained that the Linux capability module was not present and would refuse
to load.  It was determined that the packages which were compiled on 10.2
and 11.0 systems running 2.6 kernels, and although the installed kernel
headers are from 2.4.x, it picked up on this resulting in packages that
would only run under 2.4 kernels.  These new packages address the issue.

As always, any problems noted with update patches should be reported to
security@slackware.com, and we will do our best to address them as quickly as
possible.";
tag_summary = "The remote host is missing an update as announced
via advisory SSA:2009-015-01.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=SSA:2009-015-01";
                                                                                
if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.63229");
 script_tag(name:"creation_date", value:"2012-09-11 01:34:21 +0200 (Tue, 11 Sep 2012)");
 script_tag(name:"last_modification", value:"$Date: 2018-02-03 13:16:43 +0100 (Sat, 03 Feb 2018) $");
 script_version("$Revision: 8649 $");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
 name = "Slackware Advisory SSA:2009-015-01 bind 10.2/11.0 recompile ";
 script_name(name);



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Slackware Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/slackware_linux", "ssh/login/slackpack");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-slack.inc");
vuln = 0;
if(isslkpkgvuln(pkg:"bind", ver:"9.3.6_P1-i486-2_slack10.2", rls:"SLK10.2")) {
    vuln = 1;
}
if(isslkpkgvuln(pkg:"bind", ver:"9.3.6_P1-i486-2_slack11.0", rls:"SLK11.0")) {
    vuln = 1;
}

if(vuln) {
    security_message(0);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
