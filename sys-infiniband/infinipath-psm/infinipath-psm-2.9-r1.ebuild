# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-infiniband/cvs-repo/gentoo-x86/sys-infiniband/infinipath-psm/infinipath-psm-2.9-r1.ebuild,v 1.1 2012/08/11 12:44:55 ssuominen Exp $

EAPI="4"

OFED_VER="1.5.4.1"
OFED_SUFFIX="926.1005_open"
OFED_SNAPSHOT="1"
OFED_SRC_SNAPSHOT="1"

inherit openib toolchain-funcs

DESCRIPTION="OpenIB userspace driver for the PathScale InfiniBand HCAs"
KEYWORDS="~amd64 ~x86 ~amd64-linux"
IUSE=""

RDEPEND="sys-infiniband/libibverbs:${SLOT}"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

block_other_ofed_versions

src_prepare() {
	sed -e 's:uname -p:uname -m:g' \
		-e 's:-Werror::g' \
		-i buildflags.mak || die
	epatch "${FILESDIR}"/${PN}-include.patch
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README
	# install udev rules
	local udevdir=/lib/udev
	has_version sys-fs/udev && udevdir="$($(tc-getPKG_CONFIG) --variable=udevdir udev)"
	insinto "${udevdir}"/rules.d
	doins "${FILESDIR}"/42-infinipath-psm.rules
}
