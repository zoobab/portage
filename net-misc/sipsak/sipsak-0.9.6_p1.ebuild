# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-misc/cvs-repo/gentoo-x86/net-misc/sipsak/sipsak-0.9.6_p1.ebuild,v 1.8 2010/10/28 12:33:26 ssuominen Exp $

EAPI=2

DESCRIPTION="small command line tool for testing SIP applications and devices"
HOMEPAGE="http://sipsak.org/"
SRC_URI="mirror://berlios/sipsak/${P/_p/-}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc x86 ~x86-fbsd"
IUSE="gnutls"

RDEPEND="gnutls? ( net-libs/gnutls )
	net-dns/c-ares"
#	ares? ( net-dns/c-ares )"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${P/_p1}

src_configure() {
	econf \
		$(use_enable gnutls)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README TODO
}
