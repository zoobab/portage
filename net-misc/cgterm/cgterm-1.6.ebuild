# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-misc/cvs-repo/gentoo-x86/net-misc/cgterm/cgterm-1.6.ebuild,v 1.4 2009/09/11 17:41:46 patrick Exp $

inherit eutils

DESCRIPTION="Connect to C64 telnet BBS's with the correct colours and font"
HOMEPAGE="http://www.paradroid.net/cgterm/"
SRC_URI="http://www.paradroid.net/cgterm/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~ppc x86"

DEPEND=">=media-libs/libsdl-1.2.5"
RDEPEND="${DEPEND}"

src_unpack(){
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-QA.patch"
}

src_compile() {
	emake CFLAGS="${CFLAGS} `sdl-config --cflags` -DPREFIX=\\\"/usr\\\"" || die
}

src_install() {
	mkdir "${D}/usr"
	emake install PREFIX="${D}/usr" LDFLAGS="`sdl-config --libs`" || die
	rmdir "${D}/usr/etc"
}
