# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-apps/cvs-repo/gentoo-x86/sys-apps/pcfclock/pcfclock-0.44-r6.ebuild,v 1.4 2012/08/25 16:59:48 ssuominen Exp $

#EAPI="2"  can't be used because of linux-mod

inherit eutils linux-mod toolchain-funcs

DESCRIPTION="driver for the parallel port radio clock sold by Conrad Electronic"
HOMEPAGE="http://www-stud.ims.uni-stuttgart.de/~voegelas/pcf.html"
SRC_URI="http://www-stud.ims.uni-stuttgart.de/~voegelas/pcfclock/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc"
IUSE=""

RDEPEND=""
DEPEND="virtual/pkgconfig"

pkg_setup() {
	CONFIG_CHECK="PARPORT"
	linux-mod_pkg_setup
	BUILD_TARGETS="all"
	ECONF_PARAMS="--with-linux=${KERNEL_DIR}"
	MODULE_NAMES="pcfclock(::${S}/linux)"
	MODULESD_PCFCLOCK_ENABLED="yes"
	MODULESD_PCFCLOCK_EXAMPLES=( "pcfclock parport=0,none,none" )
	MODULESD_PCFCLOCK_ALIASES=(
		"char-major-181 pcfclock"
		"/dev/pcfclock0 char-major-181"
		"/dev/pcfclock1 char-major-181"
		"/dev/pcfclock2 char-major-181"
	)
}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-kernel-2.6.27.diff"
	epatch "${FILESDIR}/${P}-configure.diff"
	convert_to_m "linux/Makefile.in"
}

src_install() {
	linux-mod_src_install
	dosbin pcfdate/pcfdate
	doman {linux,pcfdate}/*.[48]
	dodoc AUTHORS ChangeLog NEWS README THANKS

	# Add configuration for udev
	local udevdir=/lib/udev
	has_version sys-fs/udev && udevdir="$($(tc-getPKG_CONFIG) --variable=udevdir udev)"
	dodir "${udevdir}"/rules.d
	echo 'KERNEL=="pcfclock*", NAME="%k", MODE="0444"' \
		> "${D}/${udevdir}"/rules.d/55-${PN}.rules
}
