# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sci-biology/cvs-repo/gentoo-x86/sci-biology/phyml/phyml-2.4.5-r2.ebuild,v 1.1 2010/10/22 15:44:40 xarthisius Exp $

EAPI=2

inherit toolchain-funcs

MY_P=${PN}_v${PV}

DESCRIPTION="Estimation of large phylogenies by maximum likelihood"
HOMEPAGE="http://atgc.lirmm.fr/phyml/"
SRC_URI="http://www.lirmm.fr/~guindon/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -e 's/^hello !!!//' \
		-e 's/$(CC) -o/$(CC) $(LDFLAGS) -o/' \
		-i Makefile || die
}

src_compile() {
	emake -e CC="$(tc-getCC)" || die
}

src_install() {
	dobin phyml || die
}
