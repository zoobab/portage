# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-cpp/cvs-repo/gentoo-x86/dev-cpp/glog/glog-0.3.2.ebuild,v 1.3 2012/09/10 22:04:15 vapier Exp $

EAPI="4"
inherit eutils

DESCRIPTION="Google's C++ logging library"
HOMEPAGE="http://code.google.com/p/google-glog/"
SRC_URI="http://google-glog.googlecode.com/files/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="gflags static-libs unwind test"

RDEPEND="gflags? ( dev-cpp/gflags )
	unwind? ( sys-libs/libunwind )"
DEPEND="${RDEPEND}
	test? (
		dev-cpp/gmock
		dev-cpp/gtest
	)"

src_prepare() {
	epatch "${FILESDIR}"/${P}-avoid-inline-asm.patch
}

src_configure() {
	export ac_cv_lib_gflags_main=$(usex gflags)
	export ac_cv_lib_unwind_backtrace=$(usex unwind)
	use test || export ac_cv_prog_GTEST_CONFIG=no
	econf $(use_enable static-libs static)
}

src_install() {
	default

	rm -rf "${D}/usr/share/doc"
	dodoc AUTHORS ChangeLog NEWS README*
	dohtml doc/*

	use static-libs || rm "${D}"/usr/lib*/*.la
}
