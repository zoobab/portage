# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-backup/cvs-repo/gentoo-x86/app-backup/deja-dup/deja-dup-23.2.ebuild,v 1.3 2012/10/07 16:37:38 phajdan.jr Exp $

EAPI=4

GNOME2_LA_PUNT="yes"

inherit autotools eutils gnome2

DESCRIPTION="Simple backup tool using duplicity back-end"
HOMEPAGE="https://launchpad.net/deja-dup/"
SRC_URI="http://launchpad.net/${PN}/24/${PV}/+download/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nautilus"

RESTRICT="test"

COMMON_DEPEND="
	dev-libs/glib:2
	dev-libs/libpeas
	x11-libs/gtk+:3
	x11-libs/libnotify

	app-backup/duplicity
	dev-libs/dbus-glib
	gnome-base/gnome-keyring

	nautilus? ( gnome-base/nautilus )"
RDEPEND="${COMMON_DEPEND}
	gnome-base/gvfs[fuse]"
DEPEND="${COMMON_DEPEND}
	app-text/yelp-tools
	dev-lang/vala:0.16
	dev-perl/Locale-gettext
	virtual/pkgconfig
	dev-util/intltool
	sys-devel/gettext"

src_prepare() {
	DOCS="NEWS AUTHORS"
	G2CONF="${G2CONF}
		$(use_with nautilus)
		--without-ccpanel
		--without-unity
		--disable-schemas-compile
		--disable-static"
	export VALAC=$(type -p valac-0.16)

	epatch "${FILESDIR}"/${P}-add-missing-include.patch
	gnome2_src_prepare
	AT_NOELIBTOOLIZE=yes eautoreconf
}

src_install() {
	gnome2_src_install
	domenu data/deja-dup.desktop
}
