# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sci-biology/cvs-repo/gentoo-x86/sci-biology/bfast/bfast-0.6.5a-r1.ebuild,v 1.1 2011/10/06 12:59:24 jlec Exp $

EAPI=4

inherit autotools

DESCRIPTION="Blat-like Fast Accurate Search Tool"
HOMEPAGE="https://sourceforge.net/projects/bfast/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="dev-perl/XML-Simple"

src_prepare() {
	sed \
		-e 's/-m64//' \
		-e 's/CFLAGS="${default_CFLAGS} ${extended_CFLAGS}"/CFLAGS="${CFLAGS} ${default_CFLAGS} ${extended_CFLAGS}"/' \
		-e 's:-g -O2::g' \
		-i configure.ac || die
	sed \
		-e 's:. test.definitions.sh:. ./test.definitions.sh:g' \
		-i tests/*sh || die
	eautoreconf
}
