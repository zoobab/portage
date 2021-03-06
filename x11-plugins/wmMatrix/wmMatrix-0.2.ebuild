# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-plugins/cvs-repo/gentoo-x86/x11-plugins/wmMatrix/wmMatrix-0.2.ebuild,v 1.14 2012/02/15 09:50:32 voyageur Exp $

IUSE=""
DESCRIPTION="WMaker DockApp: Slightly modified version of Jamie Zawinski's xmatrix screenhack."
SRC_URI="http://dockapps.windowmaker.org/download.php/id/17/${P}.tar.gz"
HOMEPAGE="http://dockapps.windowmaker.org/file.php/id/10"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXpm"
DEPEND="${RDEPEND}
	x11-proto/xproto
	x11-proto/xextproto"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86 sparc amd64 ppc ppc64"

src_compile() {
	# this version is distributed with compiled binaries!
	make clean
	emake || die
}

src_install () {
	dobin wmMatrix
}
