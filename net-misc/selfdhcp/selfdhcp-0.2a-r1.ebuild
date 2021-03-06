# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-misc/cvs-repo/gentoo-x86/net-misc/selfdhcp/selfdhcp-0.2a-r1.ebuild,v 1.1 2012/03/03 15:44:30 pacho Exp $

EAPI=4
inherit eutils

DESCRIPTION="a small stealth network autoconfigure software."
HOMEPAGE="http://selfdhcp.sourceforge.net"
SRC_URI="mirror://sourceforge/selfdhcp/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~ppc ~sparc ~x86"
IUSE=""

DEPEND="dev-libs/popt
	dev-libs/libxml2
	>=net-libs/libnet-1.0.2
	net-libs/libpcap"

src_prepare() {
	epatch "${FILESDIR}/${P}-buffer-overflow.patch"
}

src_configure() {
	econf --sysconfdir=/etc --sbindir=/sbin
}

src_install() {
	einstall sbindir="${D}"/sbin
	dodoc AUTHORS ChangeLog README TODO
}
