# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-apps/cvs-repo/gentoo-x86/sys-apps/irqbalance/irqbalance-1.0.2-r1.ebuild,v 1.3 2012/05/04 09:17:28 jdhore Exp $

EAPI=4

inherit systemd

DESCRIPTION="Distribute hardware interrupts across processors on a multiprocessor system"
HOMEPAGE="http://www.irqbalance.org/"
SRC_URI="http://irqbalance.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="caps numa"

RDEPEND="dev-libs/glib:2
	caps? ( sys-libs/libcap-ng )
	numa? ( sys-process/numactl )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	econf \
		$(use_with caps libcap-ng) \
		$(use_enable numa)
}

src_install() {
	default
	newinitd "${FILESDIR}"/irqbalance.init irqbalance
	newconfd "${FILESDIR}"/irqbalance.confd-1 irqbalance
	systemd_dounit "${FILESDIR}"/irqbalance.service
}
