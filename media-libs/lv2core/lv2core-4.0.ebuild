# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-libs/cvs-repo/gentoo-x86/media-libs/lv2core/lv2core-4.0.ebuild,v 1.1 2010/10/10 17:11:47 aballier Exp $

EAPI=2

inherit multilib toolchain-funcs

DESCRIPTION="LV2 is a simple but extensible successor of LADSPA"
HOMEPAGE="http://lv2plug.in/"
SRC_URI="http://lv2plug.in/spec/${P}.tar.gz"

LICENSE="LGPL-2.1 MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND=""
RDEPEND="!<media-libs/slv2-0.4.2"

src_configure() {
	tc-export CC CXX CPP AR RANLIB
	./waf configure --prefix=/usr --libdir=/usr/$(get_libdir) || die "failed to configure"
}

src_compile() {
	./waf || die "failed to build"
}

src_install() {
	./waf --destdir="${D}" install || die "install failed"
	dodoc AUTHORS README ChangeLog
}
