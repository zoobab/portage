# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-apps/cvs-repo/gentoo-x86/x11-apps/xwud/xwud-1.0.3.ebuild,v 1.8 2011/02/14 18:59:35 xarthisius Exp $

EAPI=3

inherit xorg-2

DESCRIPTION="image displayer for X"

KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND="x11-libs/libX11"
DEPEND="${RDEPEND}"
