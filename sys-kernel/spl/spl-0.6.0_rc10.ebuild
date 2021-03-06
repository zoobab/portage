# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-kernel/cvs-repo/gentoo-x86/sys-kernel/spl/spl-0.6.0_rc10.ebuild,v 1.3 2012/08/31 19:54:56 ryao Exp $

EAPI="4"
AUTOTOOLS_AUTORECONF="1"

inherit flag-o-matic linux-mod autotools-utils

if [[ ${PV} == "9999" ]] ; then
	inherit git-2
	EGIT_REPO_URI="git://github.com/zfsonlinux/${PN}.git"
else
	inherit eutils versionator
	MY_PV=$(replace_version_separator 3 '-')
	SRC_URI="https://github.com/downloads/zfsonlinux/${PN}/${PN}-${MY_PV}.tar.gz"
	S="${WORKDIR}/${PN}-${MY_PV}"
	KEYWORDS="~amd64"
fi

DESCRIPTION="The Solaris Porting Layer is a Linux kernel module which provides many of the Solaris kernel APIs"
HOMEPAGE="http://zfsonlinux.org/"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
IUSE="custom-cflags debug"
RESTRICT="test"

RDEPEND="!sys-devel/spl"

AT_M4DIR="config"
AUTOTOOLS_IN_SOURCE_BUILD="1"

pkg_setup() {
	CONFIG_CHECK="
		!DEBUG_LOCK_ALLOC
		!GRKERNSEC_HIDESYM
		!PREEMPT
		MODULES
		KALLSYMS
		ZLIB_DEFLATE
		ZLIB_INFLATE
	"

	kernel_is ge 2 6 26 || die "Linux 2.6.26 or newer required"

	[ ${PV} != "9999" ] && \
		{ kernel_is le 3 5 || die "Linux 3.5 is the latest supported version."; }

	check_extra_config
}

src_prepare() {
	# Workaround for hard coded path
	sed -i "s|/sbin/lsmod|/bin/lsmod|" scripts/check.sh || die

	if [ ${PV} != "9999" ]
	then
		epatch "${FILESDIR}/${PN}-0.6.0_rc9-alias-km-sleep-with-km-pushpage.patch"
	fi

	autotools-utils_src_prepare
}

src_configure() {
	use custom-cflags || strip-flags
	set_arch_to_kernel
	local myeconfargs=(
		--bindir="${EPREFIX}/bin"
		--sbindir="${EPREFIX}/sbin"
		--with-config=all
		--with-linux="${KV_DIR}"
		--with-linux-obj="${KV_OUT_DIR}"
		$(use_enable debug)
	)
	autotools-utils_src_configure
}

src_test() {
	if [[ ! -e /proc/modules ]]
	then
		die  "Missing /proc/modules"
	elif [[ $UID -ne 0 ]]
	then
		ewarn "Cannot run make check tests with FEATURES=userpriv."
		ewarn "Skipping make check tests."
	elif grep -q '^spl ' /proc/modules
	then
		ewarn "Cannot run make check tests with module spl loaded."
		ewarn "Skipping make check tests."
	else
		autotools-utils_src_test
	fi
}
