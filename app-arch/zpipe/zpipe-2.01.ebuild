# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-arch/cvs-repo/gentoo-x86/app-arch/zpipe/zpipe-2.01.ebuild,v 1.1 2011/01/05 16:17:30 mgorny Exp $

EAPI=3
inherit toolchain-funcs

MY_P=${PN}.${PV/./}
DESCRIPTION="Pipe compressor/decompressor for ZPAQ"
HOMEPAGE="http://mattmahoney.net/dc/zpaq.html"
SRC_URI="http://mattmahoney.net/dc/${MY_P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="app-arch/libzpaq"
DEPEND="${RDEPEND}
	app-arch/unzip"

src_compile() {
	emake CXX=$(tc-getCXX) LDLIBS=-lzpaq ${PN} || die
}

src_install() {
	dobin ${PN} || die
}
