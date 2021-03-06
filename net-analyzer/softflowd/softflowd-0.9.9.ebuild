# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-analyzer/cvs-repo/gentoo-x86/net-analyzer/softflowd/softflowd-0.9.9.ebuild,v 1.1 2012/03/21 06:16:00 radhermit Exp $

EAPI=4

inherit eutils

DESCRIPTION="A flow-based network monitor."
HOMEPAGE="http://www.mindrot.org/softflowd.html"
SRC_URI="http://softflowd.googlecode.com/files/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-libs/libpcap"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-no-strip.patch
}

src_install() {
	default

	docinto examples
	dodoc collector.pl

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
}
