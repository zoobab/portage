# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-plugins/cvs-repo/gentoo-x86/x11-plugins/wmsvencd/wmsvencd-0.5.0.ebuild,v 1.11 2012/09/05 08:20:34 jlec Exp $

inherit eutils

DESCRIPTION="Window Maker Dockable CD-Player with CDDB"
HOMEPAGE="file:///dev/null"
SRC_URI="mirror://gentoo/${P}.tar.gz"

DEPEND="
	x11-wm/windowmaker
	x11-libs/libXpm"
RDEPEND="${DEPEND}"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86 ~ppc"
IUSE=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/wmsvencd-compile.patch

	sed -i 's:c++ -o:c++ $(LDFLAGS) -o:' Makefile
}

src_compile() {
	emake CFLAGS="${CFLAGS} -fno-strength-reduce" || die "make failed"
}

src_install() {
	newman wmsvencd.1x wmsvencd.1
	dobin wmsvencd
	dodoc README

	domenu "${FILESDIR}"/${PN}.desktop
}
