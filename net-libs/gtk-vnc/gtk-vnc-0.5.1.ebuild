# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-libs/cvs-repo/gentoo-x86/net-libs/gtk-vnc/gtk-vnc-0.5.1.ebuild,v 1.5 2012/10/07 01:30:04 blueness Exp $

EAPI="4"
PYTHON_DEPEND="python? 2"

inherit base eutils gnome.org python

DESCRIPTION="VNC viewer widget for GTK"
HOMEPAGE="https://live.gnome.org/gtk-vnc"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~ia64 ~ppc ppc64 ~sparc x86 ~x86-fbsd"
IUSE="examples gtk3 +introspection pulseaudio python sasl vala"

# libview is used in examples/gvncviewer -- no need
# glib-2.30.1 needed to avoid linking failure due to .la files (bug #399129)
# TODO: review nsplugin when it will be considered less experimental
COMMON_DEPEND=">=dev-libs/glib-2.30.1:2
	>=dev-libs/libgcrypt-1.4.2
	dev-libs/libgpg-error
	>=net-libs/gnutls-1.4
	>=x11-libs/cairo-1.2
	>=x11-libs/gtk+-2.18:2
	x11-libs/libX11
	gtk3? ( >=x11-libs/gtk+-2.91.3:3 )
	introspection? ( >=dev-libs/gobject-introspection-0.9.4 )
	pulseaudio? ( media-sound/pulseaudio )
	python? ( >=dev-python/pygtk-2:2 )
	sasl? ( dev-libs/cyrus-sasl )"
RDEPEND="${COMMON_DEPEND}"
DEPEND="${COMMON_DEPEND}
	>=dev-lang/perl-5
	virtual/pkgconfig
	sys-devel/gettext
	>=dev-util/intltool-0.40
	vala? (
		dev-lang/vala:0.16[vapigen]
		>=dev-libs/gobject-introspection-0.9.4 )"
# eautoreconf requires gnome-common

GTK2_BUILDDIR="${WORKDIR}/${P}_gtk2"
GTK3_BUILDDIR="${WORKDIR}/${P}_gtk3"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup

	if use vala && ! use gtk3; then
		ewarn "You must set USE=gtk3 to enable vala bindings support."
	fi
}

src_prepare() {
	python_convert_shebangs -r 2 .
	mkdir "${GTK2_BUILDDIR}" || die
	mkdir "${GTK3_BUILDDIR}" || die

	# Remove a few files that were autogenerated during distcheck.
	# Having these around in srcdir breaks out of tree build since they're
	# expected to be in builddir, which is correct for trunk builds since
	# they're generated files, not source files. Funny false dichotomy.
	rm -vf "${S}"/src/{vncconnectionenums.[ch],vncdisplayenums.[ch]}

	# Fix incorrect codegendir check: h2def.py is in pygobject, not pygtk, upstream bug#????
	sed -e 's/codegendir pygtk-2.0/codegendir pygobject-2.0/g' \
		-i src/Makefile.* || die
}

src_configure() {
	local myconf
	myconf="
		$(use_with examples) \
		$(use_enable introspection) \
		$(use_with pulseaudio) \
		$(use_with sasl) \
		--with-coroutine=gthread \
		--without-libview \
		--disable-static \
		--disable-vala"

	cd ${GTK2_BUILDDIR}
	einfo "Running configure in ${GTK2_BUILDDIR}"
	ECONF_SOURCE="${S}" econf ${myconf} \
		$(use_with python) \
		--with-gtk=2.0

	if use gtk3; then
		if use vala; then
			myconf="${myconf} \
				--enable-introspection \
				--enable-vala \
				VAPIGEN=$(type -p vapigen-0.14)"
		fi

		cd ${GTK3_BUILDDIR}
		einfo "Running configure in ${GTK3_BUILDDIR}"
		# Python support is via gobject-introspection
		# Ex: from gi.repository import GtkVnc
		ECONF_SOURCE="${S}" econf ${myconf} \
			--with-python=no \
			--with-gtk=3.0
	fi
}

src_compile() {
	cd ${GTK2_BUILDDIR}
	einfo "Running make in ${GTK2_BUILDDIR}"
	emake

	if use gtk3; then
		cd ${GTK3_BUILDDIR}
		einfo "Running make in ${GTK3_BUILDDIR}"
		emake
	fi
}

src_test() {
	cd ${GTK2_BUILDDIR}
	einfo "Running make check in ${GTK2_BUILDDIR}"
	emake check

	if use gtk3; then
		cd ${GTK3_BUILDDIR}
		einfo "Running make check in ${GTK3_BUILDDIR}"
		emake check
	fi
}

src_install() {
	# Parallel installation fails sometimes, bug #328273, upstream bug #651923

	dodoc AUTHORS ChangeLog NEWS README

	cd ${GTK2_BUILDDIR}
	einfo "Running make install in ${GTK2_BUILDDIR}"
	MAKEOPTS="${MAKEOPTS} -j1" base_src_install

	if use gtk3; then
		cd ${GTK3_BUILDDIR}
		einfo "Running make install in ${GTK3_BUILDDIR}"
		MAKEOPTS="${MAKEOPTS} -j1" base_src_install
	fi

	python_clean_installation_image

	# Remove .la files
	find "${D}" -name '*.la' -exec rm -f '{}' + || die
}
