# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-libs/cvs-repo/gentoo-x86/dev-libs/libdbusmenu/libdbusmenu-0.6.2.ebuild,v 1.4 2012/08/05 10:40:06 ssuominen Exp $

EAPI=4

AYATANA_VALA_VERSION=0.16

inherit eutils flag-o-matic virtualx

DESCRIPTION="Library to pass menu structure across DBus"
HOMEPAGE="http://launchpad.net/dbusmenu"
SRC_URI="http://launchpad.net/${PN/lib}/${PV%.*}/${PV}/+download/${P}.tar.gz"

LICENSE="LGPL-2.1 LGPL-3"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE="debug gtk +introspection test"

RDEPEND=">=dev-libs/glib-2.32
	>=dev-libs/dbus-glib-0.100
	dev-libs/libxml2
	gtk? ( >=x11-libs/gtk+-3.2:3 )
	introspection? ( >=dev-libs/gobject-introspection-1 )
	!<${CATEGORY}/${PN}-0.5.1-r200"
DEPEND="${RDEPEND}
	app-text/gnome-doc-utils
	dev-util/intltool
	virtual/pkgconfig
	introspection? ( dev-lang/vala:${AYATANA_VALA_VERSION}[vapigen] )
	test? (
		>=dev-libs/json-glib-0.14[introspection?]
		dev-util/dbus-test-runner
		)"

src_prepare() {
	if use test; then
		sed -i -e 's:-DG_DISABLE_DEPRECATED::' tests/Makefile.{am,in} || die #391103, #414323
	fi
}

src_configure() {
	append-flags -Wno-error #414323

	use introspection && export VALA_API_GEN="$(type -P vapigen-${AYATANA_VALA_VERSION})"

	# dumper extra tool is only for GTK+-2.x
	econf \
		--docdir=/usr/share/doc/${PF} \
		--disable-static \
		--disable-silent-rules \
		--disable-scrollkeeper \
		$(use_enable gtk) \
		--disable-dumper \
		$(use_enable test tests) \
		$(use_enable introspection) \
		$(use_enable introspection vala) \
		$(use_enable debug massivedebugging) \
		--with-html-dir=/usr/share/doc/${PF}/html \
		--with-gtk=3
}

src_test() {
	Xemake check
}

src_install() {
	emake -j1 DESTDIR="${D}" install
	dodoc AUTHORS ChangeLog README

	local a b
	for a in ${PN}-{glib,gtk}; do
		b=/usr/share/doc/${PF}/html/${a}
		[[ -d ${ED}/${b} ]] && dosym ${b} /usr/share/gtk-doc/html/${a}
	done

	prune_libtool_files
}
