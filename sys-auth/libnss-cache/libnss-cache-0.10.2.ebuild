# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-auth/cvs-repo/gentoo-x86/sys-auth/libnss-cache/libnss-cache-0.10.2.ebuild,v 1.1 2012/10/06 19:58:03 xmw Exp $

EAPI=3

inherit eutils multilib toolchain-funcs

DESCRIPTION="libnss-cache is a library that serves nss lookups."
HOMEPAGE="http://code.google.com/p/nsscache/"
SRC_URI="http://nsscache.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="multilib"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.10.1-make.patch
	epatch "${FILESDIR}"/${PN}-0.10-fix-shadow-test.patch
}

src_compile() {
	emake CC="$(tc-getCC)" nss_cache || die
	if use multilib && has_multilib_profile; then
		emake CC="$(tc-getCC)" nss_cache32 || die
	fi
}

src_install() {
	emake DESTDIR="${D}" LIBDIR="${D}/usr/$(get_libdir)" install || die
	if use multilib && has_multilib_profile; then
		emake DESTDIR="${D}" LIBDIR="${D}/usr/$(get_libdir)" install32 || die
	fi
}
