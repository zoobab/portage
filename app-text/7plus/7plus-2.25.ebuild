# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-text/cvs-repo/gentoo-x86/app-text/7plus/7plus-2.25.ebuild,v 1.8 2010/10/02 13:12:23 tomjbe Exp $

inherit toolchain-funcs

S="${WORKDIR}/7plsrc.${PV//./}"
DESCRIPTION="An encoder for packet radio"
HOMEPAGE="http://home.t-online.de/home/dg1bbq/7plus.htm"
SRC_URI="http://home.t-online.de/home/dg1bbq/7pl${PV//./}sr.tgz"

LICENSE="7plus"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="sys-apps/sed"
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -e "s:CC = gcc:CC = $(tc-getCC):" \
		-e "s:= -O2:+=:" \
		-e "s:LDFLAGS = -s:LDFLAGS +=:" linux.mak > Makefile \
		|| die "sed Makefile failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dobin 7plus || die "dobin failed"
	dodoc 7pl_hist.nts 7plh_old.nts format.def
}
