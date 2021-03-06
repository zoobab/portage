# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/gnome-extra/cvs-repo/gentoo-x86/gnome-extra/zeitgeist-datahub/zeitgeist-datahub-0.9.5.ebuild,v 1.1 2012/09/11 19:24:44 jlec Exp $

EAPI=4

inherit autotools-utils versionator

MY_PV=$(get_version_component_range 1-2)

DESCRIPTION="Provides passive plugins to insert events into zeitgeist"
HOMEPAGE="http://launchpad.net/zeitgeist-datahub"
SRC_URI="http://launchpad.net/zeitgeist-datahub/${MY_PV}/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="download telepathy"

VALA_VER="0.16"

CDEPEND="
	dev-libs/libzeitgeist
	>=dev-libs/json-glib-0.14.0
	dev-libs/glib:2
	x11-libs/gtk+:2
	dev-lang/vala:${VALA_VER}
	telepathy? ( >=net-libs/telepathy-glib-0.18.0 )"
RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}
	virtual/pkgconfig"
PDEPEND="gnome-extra/zeitgeist"

src_prepare() {
	sed \
		-e '/Encoding/d' \
		-i src/${PN}.desktop.in || die
	rm -f src/zeitgeist-datahub.c || die
	autotools-utils_src_prepare
}

src_configure() {
	local myeconfargs=(
		$(use_enable telepathy)
		$(use_enable download downloads-monitor)
		--disable-silent-rules
		VALAC=$(type -P valac-${VALA_VER})
	)
	autotools-utils_src_configure
}
