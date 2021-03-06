# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-apps/cvs-repo/gentoo-x86/sys-apps/lomoco/lomoco-1.0-r8.ebuild,v 1.1 2012/08/19 22:12:13 hwoarang Exp $

EAPI=4
inherit autotools eutils multilib toolchain-funcs

DESCRIPTION="Lomoco can configure vendor-specific options on Logitech USB mice."
HOMEPAGE="http://www.lomoco.org/"
SRC_URI="http://www.lomoco.org/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~x86"
IUSE=""

RDEPEND="!<sys-fs/udev-114
	virtual/libusb:0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS="AUTHORS ChangeLog NEWS README"

src_prepare() {
	cp -f "${FILESDIR}"/lomoco-pm-utils-r1 "${T}" || die
	local udevdir=/lib/udev
	has_version sys-fs/udev && udevdir="$($(tc-getPKG_CONFIG) --variable=udevdir udev)"
	sed -i -e "s|@UDEVDIR@|${udevdir}|" "${T}"/lomoco-pm-utils-r1 || die

	epatch \
		"${FILESDIR}"/${P}-gentoo-hardware-support.patch \
		"${FILESDIR}"/${P}-updated-udev.patch

	eautoreconf
}

src_compile() {
	emake
	emake udev-rules
}

src_install() {
	default

	local udevdir=/lib/udev
	has_version sys-fs/udev && udevdir="$($(tc-getPKG_CONFIG) --variable=udevdir udev)"

	insinto "${udevdir}"/rules.d
	newins udev/lomoco.rules 40-lomoco.rules

	exeinto "${udevdir}"
	newexe udev/udev.lomoco lomoco

	insinto /etc
	doins "${FILESDIR}"/lomoco.conf

	exeinto /etc/pm/sleep.d
	newexe "${T}"/lomoco-pm-utils-r1 lomoco
}
