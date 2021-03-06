# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-benchmarks/cvs-repo/gentoo-x86/app-benchmarks/piozone/piozone-1.0-r2.ebuild,v 1.15 2010/11/10 19:05:42 patrick Exp $

inherit eutils

DESCRIPTION="A hard-disk benchmarking tool."
HOMEPAGE="http://www.lysator.liu.se/~pen/piozone/"
SRC_URI="ftp://ftp.lysator.liu.se/pub/unix/piozone/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

DEPEND="sys-devel/gcc"
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-gentoo.diff
}

src_compile() {
	emake || die
}

src_install() {
	dosbin piozone
}
