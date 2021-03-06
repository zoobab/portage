# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-themes/cvs-repo/gentoo-x86/x11-themes/gartoon-redux/gartoon-redux-1.10.ebuild,v 1.1 2010/06/06 21:10:05 ssuominen Exp $

EAPI=2
inherit gnome2-utils

DESCRIPTION="A massively improved variant of the well-known Gartoon theme"
HOMEPAGE="http://gnome-look.org/content/show.php/?content=74841"
SRC_URI="http://tweenk.artfx.pl/gartoon/source/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="dev-lang/perl
	gnome-base/librsvg"

RESTRICT="binchecks strip"

src_configure() {
	./configure --prefix=/usr || die
}

src_install() {
	emake icondir="${D}/usr/share/icons/GartoonRedux" install || die
	dodoc AUTHORS changelog README TODO || die
}

pkg_preinst() {	gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
