# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-text/cvs-repo/gentoo-x86/app-text/delta/delta-20060803.ebuild,v 1.10 2012/04/24 18:38:41 grobian Exp $

inherit toolchain-funcs

MY_PV="${PV:0:4}.${PV:4:2}.${PV:6:2}"
STUPID_NUM="33566"
DESCRIPTION="Heuristically minimizes interesting files"
HOMEPAGE="http://delta.tigris.org/"
SRC_URI="http://delta.tigris.org/files/documents/3103/${STUPID_NUM}/${PN}-${MY_PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ppc ppc64 s390 sh sparc x86 ~ppc-macos ~x64-macos ~x86-macos"
IUSE=""

DEPEND="dev-lang/perl"

S=${WORKDIR}/${PN}-${MY_PV}

src_compile() {
	rm -f Makefile
	tc-export CC
	emake topformflat || die
}

src_install() {
	dobin delta multidelta topformflat || die
	dodoc Readme
}
