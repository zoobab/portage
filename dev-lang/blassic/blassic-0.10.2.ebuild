# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-lang/cvs-repo/gentoo-x86/dev-lang/blassic/blassic-0.10.2.ebuild,v 1.6 2010/03/04 04:39:53 jer Exp $

EAPI=2
inherit eutils

DESCRIPTION="classic Basic interpreter"
HOMEPAGE="http://blassic.org"
SRC_URI="http://blassic.org/bin/${P}.tgz"

LICENSE="GPL-2"
KEYWORDS="hppa ppc x86 ~x86-linux ~ppc-macos ~x86-macos"
SLOT="0"
IUSE="svga X"

RDEPEND="sys-libs/ncurses
	X? ( x11-libs/libICE x11-libs/libX11 x11-libs/libSM )
	svga? ( media-libs/svgalib )"
DEPEND="${RDEPEND}
	X? ( x11-proto/xproto )"

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_with X x) \
		$(use_enable svga svgalib)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS NEWS README THANKS TODO
}
