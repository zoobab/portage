# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-wm/cvs-repo/gentoo-x86/x11-wm/aewm++/aewm++-1.1.5.ebuild,v 1.4 2010/06/06 20:12:20 ssuominen Exp $

EAPI=2
inherit eutils toolchain-funcs

DESCRIPTION="A window manager with more modern features than aewm but with the same look and feel."
HOMEPAGE="http://github.com/frankhale/aewmpp"
SRC_URI="mirror://gentoo/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~x86-fbsd"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXext"
DEPEND="${RDEPEND}
	x11-proto/xextproto
	x11-proto/xproto"

src_prepare() {
	epatch "${FILESDIR}"/${P}-gcc43.patch
	sed -i -e "s:install -s:install:" Makefile || die
}

src_compile() {
	emake CC="$(tc-getCXX)" CFLAGS="${CXXFLAGS}" LDPATH="" \
		ADDITIONAL_CFLAGS="" INCLUDES="" || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc ChangeLog README
}
