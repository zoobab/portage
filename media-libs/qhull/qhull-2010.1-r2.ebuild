# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-libs/cvs-repo/gentoo-x86/media-libs/qhull/qhull-2010.1-r2.ebuild,v 1.10 2012/09/30 16:22:55 armin76 Exp $

EAPI=3

inherit cmake-utils flag-o-matic

MY_P="${PN}${PV}"
DESCRIPTION="Geometry library"
HOMEPAGE="http://www.qhull.org"
SRC_URI="${HOMEPAGE}/download/${P}-src.tgz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="amd64 ~hppa ppc ppc64 x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE="doc static-libs"

DOCS="Announce.txt File_id.diz README.txt REGISTER.txt"
PATCHES=( "${FILESDIR}/${P}-cmake-install.patch" "${FILESDIR}/${P}-overflows.patch" )

src_configure() {
	append-flags -fno-strict-aliasing
	mycmakeargs="
		-DLIB_INSTALL_DIR="${EPREFIX}"/usr/$(get_libdir)
		-DDOC_INSTALL_DIR="${EPREFIX}"/usr/share/doc/${PF}
		$(cmake-utils_use_with static-libs STATIC_LIBS)
		$(cmake-utils_use_with doc DOCS)"
	cmake-utils_src_configure
}

pkg_preinst() {
	# remove potential symlink to avoid triggering collision-protect or
	# protect-owned (https://bugs.gentoo.org/show_bug.cgi?id=435006)
	rm "${ROOT}"/usr/include/qhull
}
