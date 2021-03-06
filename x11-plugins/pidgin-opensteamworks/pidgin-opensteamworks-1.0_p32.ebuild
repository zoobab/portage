# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-plugins/cvs-repo/gentoo-x86/x11-plugins/pidgin-opensteamworks/pidgin-opensteamworks-1.0_p32.ebuild,v 1.3 2012/07/09 17:33:14 johu Exp $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="Steam protocol plugin for pidgin"
HOMEPAGE="http://code.google.com/p/pidgin-opensteamworks/"
SRC_URI="http://dev.gentoo.org/~hasufell/distfiles/${P}.tar.xz
	http://pidgin-opensteamworks.googlecode.com/files/icons.zip
	-> ${PN}-icons.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-libs/glib:2
	dev-libs/json-glib
	net-im/pidgin"
DEPEND="${RDEPEND}
	app-arch/unzip
	virtual/pkgconfig"

pkg_setup() {
	tc-export CC
}

src_prepare() {
	# see http://code.google.com/p/pidgin-opensteamworks/issues/detail?id=31
	cp "${FILESDIR}"/${P}-Makefile "${S}"/Makefile || die
}

src_install() {
	default
	insinto /usr/share/pixmaps/pidgin/protocols
	doins -r "${WORKDIR}"/{16,48}
}
