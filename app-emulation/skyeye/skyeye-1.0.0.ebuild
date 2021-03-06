# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-emulation/cvs-repo/gentoo-x86/app-emulation/skyeye/skyeye-1.0.0.ebuild,v 1.5 2012/05/03 18:49:07 jdhore Exp $

EAPI="2"

DESCRIPTION="an ARM embedded hardware simulator"
HOMEPAGE="http://www.skyeye.org/"
SRC_URI="http://download.gro.clinux.org/skyeye/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="sys-libs/ncurses
	media-libs/freetype
	x11-libs/gtk+:2
	dev-libs/glib:2
	x11-libs/pango"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_install() {
	dobin binary/skyeye || die "skyeye"
	dodoc ChangeLog README
}
