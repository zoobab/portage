# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-themes/cvs-repo/gentoo-x86/x11-themes/echo-icon-theme/echo-icon-theme-0.3.89.0_pre20081031.ebuild,v 1.3 2012/05/05 04:10:06 jdhore Exp $

EAPI=2
inherit eutils gnome2-utils

DESCRIPTION="SVG icon theme from the Echo Icon project"
HOMEPAGE="https://fedorahosted.org/echo-icon-theme"
SRC_URI="mirror://gentoo/${P}.tar.bz2"

LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	virtual/pkgconfig
	>=x11-misc/icon-naming-utils-0.8.90"

RESTRICT="binchecks strip"

S=${WORKDIR}/${PN}-${PV/_pre*}

src_install() {
	addwrite /root/.gnome2
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
