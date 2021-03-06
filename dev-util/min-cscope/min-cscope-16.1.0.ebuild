# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-util/cvs-repo/gentoo-x86/dev-util/min-cscope/min-cscope-16.1.0.ebuild,v 1.2 2010/07/05 09:16:49 ssuominen Exp $

EAPI=2
inherit cmake-utils flag-o-matic

DESCRIPTION="Interactively examine a C program"
HOMEPAGE="http://sourceforge.net/projects/kscope/"
SRC_URI="mirror://sourceforge/kscope/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

S=${WORKDIR}/${PN}

DOCS="AUTHORS README* TODO"

src_prepare() {
	echo 'INSTALL(TARGETS min-cscope RUNTIME DESTINATION bin)' \
		>> src/CMakeLists.txt
}

src_configure() {
	append-flags -I"${S}/sort"
	cmake-utils_src_configure
}
