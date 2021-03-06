# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-misc/cvs-repo/gentoo-x86/net-misc/cbqinit/cbqinit-0.7.3-r1.ebuild,v 1.6 2012/03/18 17:53:05 armin76 Exp $

inherit eutils

DESCRIPTION="Sets up class-based queue traffic control (QoS) with iproute2"
HOMEPAGE="http://www.sourceforge.net/projects/cbqinit"
SRC_URI="mirror://sourceforge/cbqinit/cbq.init-v${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ~arm hppa ~mips ppc sparc x86"
IUSE=""

RDEPEND="sys-apps/iproute2"
DEPEND=""

S=${WORKDIR}

src_unpack() {
	cp "${DISTDIR}"/cbq.init-v${PV} "${S}"/cbqinit || die
	grep '^#' cbqinit > README
	epatch "${FILESDIR}"/${P}-gentoo.patch
}

src_install() {
	dosbin cbqinit || die
	newinitd "${FILESDIR}"/rc_cbqinit-r1 cbqinit
	dodoc "${FILESDIR}"/cbq-1280.My_first_shaper.sample README
}
