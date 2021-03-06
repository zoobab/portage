# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-benchmarks/cvs-repo/gentoo-x86/app-benchmarks/piozone/piozone-1.0-r3.ebuild,v 1.4 2012/08/08 19:33:16 ranger Exp $

EAPI="2"

inherit eutils flag-o-matic toolchain-funcs

DESCRIPTION="A hard-disk benchmarking tool."
HOMEPAGE="http://www.lysator.liu.se/~pen/piozone/"
SRC_URI="ftp://ftp.lysator.liu.se/pub/unix/piozone/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

src_prepare() {
	epatch "${FILESDIR}"/${PF}-gentoo.diff
}

src_compile() {
	append-flags -D_LARGEFILE64_SOURCE
	emake CC=$(tc-getCC) || die
}

src_install() {
	dosbin piozone
}
