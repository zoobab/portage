# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sci-geosciences/cvs-repo/gentoo-x86/sci-geosciences/josm-plugins/josm-plugins-20090504.ebuild,v 1.1 2009/05/04 18:19:58 hanno Exp $

DESCRIPTION="Set of plugins for josm"
HOMEPAGE="http://josm.openstreetmap.de/"
SRC_URI="mirror://gentoo/${P}.tar.lzma"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND=">=sci-geosciences/josm-1.526"
RDEPEND="${DEPEND}"
IUSE=""

src_compile() {
	einfo Nothing to compile
}

src_install() {
	insinto /usr/lib/josm/plugins
	doins *.jar
}
