# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-libs/cvs-repo/gentoo-x86/net-libs/libnatpmp/libnatpmp-20120821.ebuild,v 1.1 2012/08/27 00:41:25 blueness Exp $

EAPI="4"
inherit eutils toolchain-funcs multilib

DESCRIPTION="An alternative protocol to UPnP IGD specification"
HOMEPAGE="http://miniupnp.free.fr/libnatpmp.html"
SRC_URI="http://miniupnp.free.fr/files/download.php?file=${P}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~x86-fbsd"
IUSE="static-libs"

src_prepare() {
	epatch "${FILESDIR}"/respect-FLAGS-${PV}.patch
	epatch "${FILESDIR}"/respect-libdir-${PV}.patch
	use static-libs || epatch "${FILESDIR}"/remove-static-lib-${PV}.patch
	tc-export CC
}

src_install() {
	emake PREFIX="${D}" GENTOO_LIBDIR="$(get_libdir)" install

	dodoc Changelog.txt README
	doman natpmpc.1
}
