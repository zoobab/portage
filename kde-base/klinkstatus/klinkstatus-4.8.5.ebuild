# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-base/cvs-repo/gentoo-x86/kde-base/klinkstatus/klinkstatus-4.8.5.ebuild,v 1.4 2012/09/03 12:20:55 scarabeus Exp $

EAPI=4

KDE_HANDBOOK="optional"
KMNAME="kdewebdev"
inherit kde4-meta

DESCRIPTION="KDE web development - link validity checker"
KEYWORDS="amd64 ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug tidy"

DEPEND="
	$(add_kdebase_dep kdepimlibs 'semantic-desktop')
	tidy? ( app-text/htmltidy )
"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		-DWITH_KdepimLibs=ON
		$(cmake-utils_use_with tidy LibTidy)
	)

	kde4-meta_src_configure
}

pkg_postinst() {
	kde4-meta_pkg_postinst

	echo
	elog "To use scripting in ${PN}, install dev-lang/ruby."
	echo
}
