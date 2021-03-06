# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-ml/cvs-repo/gentoo-x86/dev-ml/pomap/pomap-3.0.1.ebuild,v 1.1 2012/10/10 11:54:19 aballier Exp $

EAPI=4

OASIS_BUILD_DOCS=1

inherit oasis

DESCRIPTION="Partially Ordered Map ADT for O'Caml"
HOMEPAGE="http://bitbucket.org/mmottl/pomap"
SRC_URI="http://bitbucket.org/mmottl/pomap/downloads/${P}.tar.gz"
LICENSE="LGPL-2.1-with-linking-exception"

DEPEND=""
RDEPEND="${DEPEND}"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="examples"

DOCS=( "AUTHORS.txt" "CHANGES.txt" "README.md" )

src_install() {
	oasis_src_install
	if use examples ; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}
