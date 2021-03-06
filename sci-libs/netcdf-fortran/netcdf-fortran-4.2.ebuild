# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sci-libs/cvs-repo/gentoo-x86/sci-libs/netcdf-fortran/netcdf-fortran-4.2.ebuild,v 1.2 2012/08/02 21:16:24 bicatali Exp $

EAPI=4

inherit autotools-utils fortran-2

DESCRIPTION="Scientific library and interface for array oriented data access"
HOMEPAGE="http://www.unidata.ucar.edu/software/netcdf/"
SRC_URI="ftp://ftp.unidata.ucar.edu/pub/netcdf/${P}.tar.gz"

LICENSE="UCAR-Unidata"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc examples static-libs"

RDEPEND="sci-libs/netcdf
	virtual/fortran"

DEPEND="${RDEPEND}
	dev-lang/cfortran"

FORTRAN_STANDARD="77 90"
AUTOTOOLS_IN_SOURCE_BUILD=1

src_prepare() {
	# use system cfortran
	rm fortran/cfortran.h || die
	autotools-utils_src_prepare
}

src_install() {
	autotools-utils_src_install
	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}
