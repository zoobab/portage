# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-sound/cvs-repo/gentoo-x86/media-sound/jokosher/jokosher-0.11.5.ebuild,v 1.1 2011/05/09 18:45:26 angelos Exp $

EAPI="3"
PYTHON_DEPEND="2"

inherit eutils gnome2 distutils

DESCRIPTION="A simple yet powerful multi-track studio"
HOMEPAGE="http://www.jokosher.org"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome"

# NOTE: setuptools are a runtime requirement as the app
#       loads its extensions via pkg_resources
RDEPEND="dev-python/dbus-python
	>=dev-python/gst-python-0.10.8
	dev-python/pycairo
	>=dev-python/pygtk-2.10
	gnome-base/librsvg
	>=media-libs/gnonlin-0.10.9
	>=media-libs/gst-plugins-good-0.10.6
	>=media-libs/gst-plugins-bad-0.10.5
	>=media-plugins/gst-plugins-alsa-0.10.14
	>=media-plugins/gst-plugins-flac-0.10.6
	gnome? ( >=media-plugins/gst-plugins-gnomevfs-0.10.14 )
	>=media-plugins/gst-plugins-lame-0.10.6
	>=media-plugins/gst-plugins-ogg-0.10.14
	>=media-plugins/gst-plugins-vorbis-0.10.14
	>=media-plugins/gst-plugins-ladspa-0.10.5
	x11-themes/hicolor-icon-theme
	dev-python/setuptools
	dev-python/pyxdg"
DEPEND="${RDEPEND}
	app-text/scrollkeeper"

PYTHON_MODNAME="Jokosher"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	gnome2_src_prepare
	epatch "${FILESDIR}"/${PN}-0.11.1-update-database.patch \
		"${FILESDIR}"/${P}-cairo.patch
}

src_configure() {
	# Don't run gnome2_src_configure().
	:
}

pkg_postinst() {
	distutils_pkg_postinst
	gnome2_pkg_postinst
}

pkg_postrm() {
	distutils_pkg_postrm
	gnome2_pkg_postrm
}
