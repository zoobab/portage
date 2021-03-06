# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-libs/cvs-repo/gentoo-x86/x11-libs/mx/mx-1.2.1.ebuild,v 1.1 2011/09/15 22:10:39 eva Exp $

EAPI="4"
CLUTTER_LA_PUNT="yes"

inherit clutter

DESCRIPTION="A widget toolkit using Clutter"
HOMEPAGE="http://clutter-project.org/"

LICENSE="LGPL-2.1"
SLOT="1.0"
KEYWORDS="~amd64 ~x86"
IUSE="dbus debug doc glade +gtk +introspection startup-notification"

RDEPEND="
	>=dev-libs/glib-2.26.0:2
	>=media-libs/clutter-1.4.0:1.0
	>=x11-apps/xrandr-1.2.0

	x11-libs/gdk-pixbuf:2[introspection?]

	dbus? ( >=dev-libs/dbus-glib-0.82 )
	glade? (
		>=dev-util/glade-3.4.5:3
		<dev-util/glade-3.9.1:3 )
	gtk? ( >=x11-libs/gtk+-2.20:2[introspection?] )
	introspection? ( >=dev-libs/gobject-introspection-0.6.4 )
	startup-notification? ( >=x11-libs/startup-notification-0.9 )"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35.0
	sys-devel/gettext
	doc? ( >=dev-util/gtk-doc-1.14 )"

DOCS="ChangeLog NEWS README"

src_prepare() {
	# Tests are interactive, no use for us
	sed -e 's/^\(SUBDIRS .*\)tests\(.*\)/\1 \2/g' \
		-i Makefile.am -i Makefile.in || die
}

src_configure() {
	local myconf

	myconf="--enable-maintainer-flags=no
		--with-winsys=x11
		$(use_enable gtk gtk-widgets)
		$(use_enable introspection)
		$(use_with dbus)
		$(use_with glade)
		$(use_with startup-notification)"

	econf ${myconf}
}
