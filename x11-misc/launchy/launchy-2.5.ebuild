# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-misc/cvs-repo/gentoo-x86/x11-misc/launchy/launchy-2.5.ebuild,v 1.2 2012/07/29 18:38:14 angelos Exp $

EAPI=4
inherit fdo-mime gnome2-utils qt4-r2

DESCRIPTION="utility that merges application menus, your desktop and even your file manager"
HOMEPAGE="http://www.launchy.net/"
SRC_URI="http://www.launchy.net/downloads/src/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/qt-gui:4"
DEPEND="${RDEPEND}
	dev-libs/boost"

PATCHES=( "${FILESDIR}"/${P}-underlink.patch )

src_prepare() {
	sed -i -e "s:lib/launchy:$(get_libdir)/launchy:" src/src.pro \
		platforms/unix/unix.pro \
		plugins/*/*.pro || die "sed failed"
	qt4-r2_src_prepare
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}
