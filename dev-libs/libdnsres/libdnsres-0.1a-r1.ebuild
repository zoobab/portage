# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-libs/cvs-repo/gentoo-x86/dev-libs/libdnsres/libdnsres-0.1a-r1.ebuild,v 1.9 2010/12/02 17:27:28 flameeyes Exp $

inherit eutils autotools

DESCRIPTION="A non-blocking DNS resolver library"
HOMEPAGE="http://www.monkey.org/~provos/libdnsres/"
SRC_URI="http://www.monkey.org/~provos/${P}.tar.gz"

LICENSE="|| ( as-is BSD )"
SLOT="0"
KEYWORDS="amd64 ~ppc sparc x86"
IUSE=""

DEPEND="dev-libs/libevent"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}/${P}-autotools.patch"

	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc README
}
