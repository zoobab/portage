# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-cpp/cvs-repo/gentoo-x86/dev-cpp/clucene/clucene-2.3.3.4-r4.ebuild,v 1.1 2012/09/10 11:22:31 scarabeus Exp $

EAPI=4

MY_PN="${PN}"-core
MY_P="${MY_PN}"-"${PV}"

inherit cmake-utils multilib

DESCRIPTION="High-performance, full-featured text search engine based off of lucene in C++"
HOMEPAGE="http://clucene.sourceforge.net/"
SRC_URI="mirror://sourceforge/clucene/${MY_P}.tar.gz"

LICENSE="|| ( Apache-2.0 LGPL-2.1 )"
SLOT="1"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos"

IUSE="debug doc static-libs"

DEPEND="
	doc? ( >=app-doc/doxygen-1.4.2 )
"
RDEPEND="!<app-misc/strigi-0.7.5-r3"

RESTRICT="test"

DOCS=(AUTHORS ChangeLog README README.PACKAGE REQUESTS)

S="${WORKDIR}/${MY_PN}-${PV}"

PATCHES=(
	"${FILESDIR}/${P}-contrib.patch"
	"${FILESDIR}/${P}-pkgconfig.patch"
)

src_prepare() {
	base_src_prepare

	# patch out installing bundled boost headers, we build against system one
	sed -i \
		-e '/ADD_SUBDIRECTORY (src\/ext)/d' \
		CMakeLists.txt || die
	rm -rf src/ext || die
}

src_configure() {
	# Disabled threads: see upstream bug
	# https://sourceforge.net/tracker/?func=detail&aid=3237301&group_id=80013&atid=558446
	local mycmakeargs=(
		-DENABLE_ASCII_MODE=OFF
		-DENABLE_PACKAGING=OFF
		-DDISABLE_MULTITHREADING=OFF
		-DBUILD_CONTRIBS_LIB=ON
		"-DLIB_DESTINATION=${EPREFIX}/usr/$(get_libdir)"
		$(cmake-utils_use_enable debug)
		$(cmake-utils_use_enable doc CLDOCS)
		$(cmake-utils_use_build static-libs STATIC_LIBRARIES)
	)

	cmake-utils_src_configure
}
