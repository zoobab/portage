# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-gfx/cvs-repo/gentoo-x86/media-gfx/sane-backends/sane-backends-1.0.22-r1.ebuild,v 1.16 2012/06/08 03:01:10 zmedico Exp $

EAPI="4"

inherit eutils flag-o-matic multilib user

# gphoto and v4l are handled by their usual USE flags.
# The pint backend was disabled because I could not get it to compile.
# The mustek_usb2 backend would force us to use --enable-pthreads which is off
# by default for linux. Let's keep this one out until we find a way how to
# handle this cleanly.
IUSE_SANE_BACKENDS="
	abaton
	agfafocus
	apple
	artec
	artec_eplus48u
	as6e
	avision
	bh
	canon
	canon630u
	canon_dr
	canon_pp
	cardscan
	coolscan
	coolscan2
	coolscan3
	dc25
	dc210
	dc240
	dell1600n_net
	dmc
	epjitsu
	epson
	epson2
	fujitsu
	genesys
	gt68xx
	hp
	hp3500
	hp3900
	hp4200
	hp5400
	hp5590
	hpsj5s
	hpljm1005
	hs2p
	ibm
	kodak
	kvs1025
	kvs20xx
	leo
	lexmark
	ma1509
	magicolor
	matsushita
	microtek
	microtek2
	mustek
	mustek_pp
	mustek_usb
	nec
	net
	niash
	p5
	pie
	pixma
	plustek
	plustek_pp
	qcam
	ricoh
	rts8891
	s9036
	sceptre
	sharp
	sm3600
	sm3840
	snapscan
	sp15c
	st400
	stv680
	tamarack
	teco1
	teco2
	teco3
	test
	u12
	umax
	umax_pp
	umax1220u
	xerox_mfp"

IUSE="avahi usb gphoto2 ipv6 v4l doc"

for backend in ${IUSE_SANE_BACKENDS}; do
	IUSE="${IUSE} +sane_backends_${backend}"
done

DESCRIPTION="Scanner Access Now Easy - Backends"
HOMEPAGE="http://www.sane-project.org/"

RDEPEND="
	sane_backends_dc210? ( virtual/jpeg )
	sane_backends_dc240? ( virtual/jpeg )
	sane_backends_dell1600n_net? ( virtual/jpeg )
	avahi? ( >=net-dns/avahi-0.6.24 )
	sane_backends_canon_pp? ( sys-libs/libieee1284 )
	sane_backends_hpsj5s? ( sys-libs/libieee1284 )
	sane_backends_mustek_pp? ( sys-libs/libieee1284 )
	usb? ( virtual/libusb:0 )
	gphoto2? (
		media-libs/libgphoto2
		virtual/jpeg
	)
	v4l? ( media-libs/libv4l )"

DEPEND="${RDEPEND}
	v4l? ( sys-kernel/linux-headers )
	doc? (
		virtual/latex-base
		dev-texlive/texlive-latexextra
	)
	>=sys-apps/sed-4
	virtual/pkgconfig"

# We now use new syntax construct (SUBSYSTEMS!="usb|usb_device)
RDEPEND="${RDEPEND}
	!<sys-fs/udev-114"

SRC_URI="ftp://ftp.sane-project.org/pub/sane/${P}/${P}.tar.gz
	ftp://ftp.sane-project.org/pub/sane/old-versions/${P}/${P}.tar.gz"
SLOT="0"
LICENSE="GPL-2 public-domain"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 sparc x86"

pkg_setup() {
	enewgroup scanner
}

src_prepare() {
	cat >> backend/dll.conf.in <<-EOF
	# Add support for the HP-specific backend.  Needs net-print/hplip installed.
	hpaio
	# Add support for the Epson-specific backend.  Needs media-gfx/iscan installed.
	epkowa
	EOF
	#epatch "${DISTDIR}/${P}-i18n.patch"

	# Bug #368083
	epatch "${FILESDIR}"/${P}-xerox_mfp-usb.patch
	# Bug #356919
	epatch "${FILESDIR}"/${P}-libv4l-0.8.3.patch
	# Bug #329047
	epatch "${FILESDIR}"/niash_array_index.patch
}

src_configure() {
	append-flags -fno-strict-aliasing

	# the blank is intended - an empty string would result in building ALL backends.
	local BACKENDS=" "

	use gphoto2 && BACKENDS="gphoto2"
	use v4l && BACKENDS="${BACKENDS} v4l"
	for backend in ${IUSE_SANE_BACKENDS}; do
		if use "sane_backends_${backend}"; then
			BACKENDS="${BACKENDS} ${backend}"
		fi
	done

	local myconf=$(use_enable usb libusb)
	if ! use doc; then
		myconf="${myconf} --disable-latex"
	fi
	if use sane_backends_mustek_pp; then
		myconf="${myconf} --enable-parport-directio"
	fi
	if ! ( use sane_backends_canon_pp || use sane_backends_hpsj5s || use sane_backends_mustek_pp ); then
		myconf="${myconf} sane_cv_use_libieee1284=no"
	fi
	SANEI_JPEG="sanei_jpeg.o" SANEI_JPEG_LO="sanei_jpeg.lo" \
	BACKENDS="${BACKENDS}" econf \
		$(use_with gphoto2) \
		$(use_enable ipv6) \
		$(use_enable avahi) \
		${myconf}
}

src_compile() {
	emake VARTEXFONTS="${T}/fonts" || die

	if use usb; then
		cd tools/hotplug
		grep -v '^$' libsane.usermap > libsane.usermap.new
		mv libsane.usermap.new libsane.usermap
	fi
}

src_install () {
	emake INSTALL_LOCKPATH="" DESTDIR="${D}" install \
		docdir=/usr/share/doc/${PF} || die
	keepdir /var/lib/lock/sane
	fowners root:scanner /var/lib/lock/sane
	fperms g+w /var/lib/lock/sane
	dodir /etc/env.d
	if use usb; then
		insinto /etc/hotplug/usb
		exeinto /etc/hotplug/usb
		doins tools/hotplug/libsane.usermap
		doexe tools/hotplug/libusbscanner
		newdoc tools/hotplug/README README.hotplug
		echo >> "${D}"/etc/env.d/30sane "USB_DEVFS_PATH=/dev/bus/usb"
	fi
	insinto /lib/udev/rules.d
	newins tools/udev/libsane.rules 41-libsane.rules

	dodoc NEWS AUTHORS ChangeLog* README README.linux
	echo "SANE_CONFIG_DIR=/etc/sane.d" >> "${D}"/etc/env.d/30sane
	find "${D}" -name "*.la" | while read file; do rm "${file}"; done
}
