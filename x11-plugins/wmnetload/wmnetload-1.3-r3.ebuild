# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-plugins/cvs-repo/gentoo-x86/x11-plugins/wmnetload/wmnetload-1.3-r3.ebuild,v 1.8 2012/03/18 19:56:30 armin76 Exp $

inherit autotools eutils

DESCRIPTION="Network interface monitor dockapp"
HOMEPAGE="http://freshmeat.net/projects/wmnetload/"
SRC_URI="ftp://truffula.com/pub/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"
IUSE=""

RDEPEND=">=x11-libs/libdockapp-0.6.1"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}/${PN}-${PVR}-norpath.patch"

	eautoreconf
}

src_install() {
	einstall || die "einstall failed."
	dodoc AUTHORS README NEWS
}
