# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sci-biology/cvs-repo/gentoo-x86/sci-biology/clustalw-mpi/clustalw-mpi-0.13-r1.ebuild,v 1.1 2011/06/19 10:00:09 jlec Exp $

EAPI=4

inherit eutils toolchain-funcs

DESCRIPTION="A parallel (MPI) implemention of the Clustal-W general purpose multiple alignment algorithm"
HOMEPAGE="http://www.bii.a-star.edu.sg/achievements/applications/clustalw/index.php"
SRC_URI="http://web.bii.a-star.edu.sg/~kuobin/${PN}/${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="public-domain"
IUSE="mpi_njtree static_pairalign"

DEPEND="virtual/mpi"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${PV}-gentoo.patch
	if use mpi_njtree; then
		sed -e "s/TREES_FLAG/#TREES_FLAG/" -i Makefile || \
			die "Failed to configure MPI code for NJ trees."
	fi
	if use static_pairalign; then
		sed -e "s/DDYNAMIC_SCHEDULING/DSTATIC_SCHEDULING/" -i Makefile || \
			die "Failed to configure static scheduling for pair alignments."
	fi
}

src_install() {
	dobin ${PN}
	newdoc README.${PN} README
}
