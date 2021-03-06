# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sci-physics/cvs-repo/gentoo-x86/sci-physics/clhep/clhep-2.1.2.3.ebuild,v 1.1 2012/06/28 00:31:06 bicatali Exp $

EAPI=4

inherit cmake-utils multilib

DESCRIPTION="High Energy Physics C++ library"
HOMEPAGE="http://www.cern.ch/clhep"
SRC_URI="http://proj-clhep.web.cern.ch/proj-clhep/DISTRIBUTION/tarFiles/${P}.tgz"
LICENSE="GPL-3 LGPL-3"
SLOT="2"
KEYWORDS="~amd64 ~hppa ~ppc ~x86 ~amd64-linux ~x86-linux"

IUSE="doc static-libs test"
RDEPEND=""
DEPEND="${RDEPEND}
	doc? ( virtual/latex-base )"

S="${WORKDIR}/${PV}/CLHEP"

src_prepare() {
	epatch "${FILESDIR}"/${P}-libdir.patch
	# respect flags
	sed -i -e 's:-O::g' cmake/Modules/ClhepVariables.cmake || die
	# dont build test if not asked
	if ! use test; then
		sed -i \
			-e '/add_subdirectory(test)/d' \
			*/CMakeLists.txt || die
	fi
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable test TESTING)
		$(cmake-utils_use doc CLHEP_BUILD_DOCS)
	)
	DESTDIR="${ED}" cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	use static-libs || rm "${ED}"/usr/$(get_libdir)/*.a
	dodoc README ChangeLog
}
