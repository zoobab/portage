# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-vcs/cvs-repo/gentoo-x86/dev-vcs/giggle/giggle-0.5.ebuild,v 1.6 2012/05/03 02:57:15 jdhore Exp $

EAPI="1"

inherit autotools gnome2

DESCRIPTION="GTK+ Frontend for GIT"
HOMEPAGE="http://live.gnome.org/giggle"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86 ~x86-interix ~amd64-linux ~x86-linux"
IUSE="eds"

RDEPEND=">=dev-vcs/git-1.5
		 >=dev-libs/glib-2.18:2
		 >=x11-libs/gtk+-2.10:2
		 >=x11-libs/gtksourceview-2.8:2.0
		 gnome-base/gnome-common
		 eds? ( gnome-extra/evolution-data-server )
		 >=gnome-base/libglade-2.4:2.0
		 >=x11-libs/vte-0.17:0"
DEPEND="${RDEPEND}
		  sys-devel/gettext
		virtual/pkgconfig
		>=dev-util/intltool-0.35
		>=sys-devel/autoconf-2.64
		>=sys-devel/libtool-2"

DOCS="AUTHORS ChangeLog NEWS README"

G2CONF="$(use_enable eds evolution-data-server)"

src_unpack() {
	gnome2_src_unpack
	cd "${S}"
	eautoreconf
}
