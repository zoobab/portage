# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-analyzer/cvs-repo/gentoo-x86/net-analyzer/thc-ipv6/thc-ipv6-1.8.ebuild,v 1.2 2012/03/23 19:42:34 mr_bones_ Exp $

EAPI=4

inherit eutils

DESCRIPTION="complete tool set to attack the inherent protocol weaknesses of IPV6 and ICMP6"
HOMEPAGE="http://freeworld.thc.org/thc-ipv6/"
SRC_URI="http://freeworld.thc.org/releases/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-libs/libpcap
	dev-libs/openssl"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.4-Makefile.patch
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
	dodoc CHANGES README
}
