# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-fonts/cvs-repo/gentoo-x86/media-fonts/font-alias/font-alias-1.0.3.ebuild,v 1.10 2012/05/11 03:08:54 aballier Exp $

# Must be before x-modular eclass is inherited
#SNAPSHOT="yes"

EAPI=3
inherit xorg-2

DESCRIPTION="X.Org font aliases"

KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}
	x11-apps/mkfontscale
	>=media-fonts/font-util-1.1.1-r1"
