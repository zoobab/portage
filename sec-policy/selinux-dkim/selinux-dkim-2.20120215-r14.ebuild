# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sec-policy/cvs-repo/gentoo-x86/sec-policy/selinux-dkim/selinux-dkim-2.20120215-r14.ebuild,v 1.2 2012/07/30 16:25:42 swift Exp $
EAPI="4"

IUSE=""
MODS="dkim"
BASEPOL="2.20120215-r14"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for dkim"

KEYWORDS="amd64 x86"
