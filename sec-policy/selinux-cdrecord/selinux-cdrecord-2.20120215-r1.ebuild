# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sec-policy/cvs-repo/gentoo-x86/sec-policy/selinux-cdrecord/selinux-cdrecord-2.20120215-r1.ebuild,v 1.1 2012/06/27 20:34:09 swift Exp $
EAPI="4"

IUSE=""
MODS="cdrecord"
BASEPOL="2.20120215-r13"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for cdrecord"

KEYWORDS="~amd64 ~x86"
