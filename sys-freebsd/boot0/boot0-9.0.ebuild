# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-freebsd/cvs-repo/gentoo-x86/sys-freebsd/boot0/boot0-9.0.ebuild,v 1.4 2012/05/17 14:36:08 aballier Exp $

EAPI=2

inherit bsdmk freebsd flag-o-matic

DESCRIPTION="FreeBSD's bootloader"
SLOT="0"
KEYWORDS="~amd64-fbsd ~sparc-fbsd ~x86-fbsd"

IUSE="bzip2 ieee1394 tftp zfs"

SRC_URI="mirror://gentoo/${SYS}.tar.bz2
	mirror://gentoo/${LIB}.tar.bz2
	mirror://gentoo/${CONTRIB}.tar.bz2"

RDEPEND=""
DEPEND="=sys-freebsd/freebsd-mk-defs-${RV}*
	=sys-freebsd/freebsd-lib-${RV}*"

S="${WORKDIR}/sys/boot"

boot0_use_enable() {
	use ${1} && mymakeopts="${mymakeopts} LOADER_${2}_SUPPORT=\"yes\""
}

pkg_setup() {
	boot0_use_enable ieee1394 FIREWIRE
	boot0_use_enable zfs ZFS
	boot0_use_enable tftp TFTP
	boot0_use_enable bzip2 BZIP2
}

src_prepare() {
	sed -e '/-fomit-frame-pointer/d' -e '/-mno-align-long-strings/d' \
		-i "${S}"/i386/boot2/Makefile \
		-i "${S}"/i386/gptboot/Makefile \
		-i "${S}"/i386/gptzfsboot/Makefile \
		-i "${S}"/i386/zfsboot/Makefile || die
}

src_compile() {
	strip-flags
	append-flags "-fno-strict-aliasing"
	NOFLAGSTRIP="yes" freebsd_src_compile
}

src_install() {
	dodir /boot/defaults
	mkinstall FILESDIR=/boot || die "mkinstall failed"
}
