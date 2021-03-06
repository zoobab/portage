# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-power/cvs-repo/gentoo-x86/sys-power/upower/upower-0.9.18.ebuild,v 1.2 2012/09/01 14:16:17 ssuominen Exp $

EAPI=4

# PYTHON_DEPEND="test? 3"
# inherit python

inherit eutils systemd toolchain-funcs

DESCRIPTION="D-Bus abstraction for enumerating power devices and querying history and statistics"
HOMEPAGE="http://upower.freedesktop.org/"
SRC_URI="http://${PN}.freedesktop.org/releases/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="debug doc +introspection ios kernel_FreeBSD kernel_linux systemd" # test

COMMON_DEPEND=">=dev-libs/dbus-glib-0.100
	>=dev-libs/glib-2.22
	sys-apps/dbus
	>=sys-auth/polkit-0.104-r1
	introspection? ( dev-libs/gobject-introspection )
	kernel_linux? (
		|| ( >=sys-fs/udev-171-r6[gudev] <sys-fs/udev-171[extras] )
		virtual/libusb:1
		ios? (
			>=app-pda/libimobiledevice-1
			>=app-pda/libplist-1
			)
		)
	systemd? ( sys-apps/systemd )"
RDEPEND="${COMMON_DEPEND}
	kernel_linux? ( >=sys-power/pm-utils-1.4.1 )
	systemd? ( app-shells/bash )"
DEPEND="${COMMON_DEPEND}
	dev-libs/libxslt
	app-text/docbook-xsl-stylesheets
	dev-util/intltool
	virtual/pkgconfig
	doc? (
		dev-util/gtk-doc
		app-text/docbook-xml-dtd:4.1.2
		)"

src_prepare() {
	sed -i -e '/DISABLE_DEPRECATED/d' configure || die
}

src_configure() {
	local backend

	if use kernel_linux; then
		backend=linux
	elif use kernel_FreeBSD; then
		backend=freebsd
	else
		backend=dummy
	fi

	# note: systemd.eclass is missing support for --with-systemdutildir=
	econf \
		--localstatedir="${EPREFIX}"/var \
		$(use_enable introspection) \
		--disable-static \
		$(use_enable debug verbose-mode) \
		--enable-man-pages \
		$(use_enable doc gtk-doc) \
		$(use_enable systemd) \
		--disable-tests \
		--with-html-dir="${EPREFIX}"/usr/share/doc/${PF}/html \
		--with-backend=${backend} \
		$(use_with ios idevice) \
		"$(systemd_with_unitdir)"
}

src_install() {
	local udevdir=/lib/udev
	use kernel_linux && udevdir="$($(tc-getPKG_CONFIG) --variable=udevdir udev)"

	emake DESTDIR="${D}" udevrulesdir="${udevdir}"/rules.d install

	dodoc AUTHORS HACKING NEWS README
	keepdir /var/lib/upower #383091
	prune_libtool_files
}
