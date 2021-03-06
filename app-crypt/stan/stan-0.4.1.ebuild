# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-crypt/cvs-repo/gentoo-x86/app-crypt/stan/stan-0.4.1.ebuild,v 1.4 2011/04/01 12:54:58 c1pher Exp $

EAPI="2"
inherit autotools eutils

DESCRIPTION="Stan is a console application that analyzes binary streams and calculates statistical information."
HOMEPAGE="http://www.roqe.org/stan/"
SRC_URI="http://www.roqe.org/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	epatch "${FILESDIR}/${P}-errno.patch"
	sed -i -e "s/-O3/${CFLAGS}/" configure.in || die "sed failed"
	eautoreconf
}

src_install() {
	emake install DESTDIR="${D}" || die "install failed"
	dodoc README || die
}
