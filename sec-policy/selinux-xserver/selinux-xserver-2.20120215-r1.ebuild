# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sec-policy/cvs-repo/gentoo-x86/sec-policy/selinux-xserver/selinux-xserver-2.20120215-r1.ebuild,v 1.1 2012/05/20 18:40:08 swift Exp $
EAPI="4"

IUSE=""
MODS="xserver"
BASEPOL="2.20120215-r9"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for xserver"

KEYWORDS="~amd64 ~x86"
