# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-gfx/cvs-repo/gentoo-x86/media-gfx/byzanz/byzanz-0.2.3.ebuild,v 1.4 2012/05/05 07:00:22 jdhore Exp $

EAPI="2"
GCONF_DEBUG="no"

inherit gnome2

DESCRIPTION="Screencasting program that saves casts as GIF files"
HOMEPAGE="http://people.freedesktop.org/~company/byzanz/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=x11-libs/libXdamage-1.0
	>=dev-libs/glib-2.16:2
	>=x11-libs/gtk+-2.17.10:2
	>=gnome-base/gconf-2.10
	|| ( gnome-base/gnome-panel[bonobo] <gnome-base/gnome-panel-2.32 )
	>=media-libs/gst-plugins-base-0.10.24
	media-libs/gst-plugins-good
	media-plugins/gst-plugins-theora
	media-plugins/gst-plugins-vp8
	>=x11-libs/cairo-1.8.10"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	dev-util/intltool
	>=x11-proto/damageproto-1.0"

DOCS="AUTHORS ChangeLog MAINTAINERS NEWS README"
