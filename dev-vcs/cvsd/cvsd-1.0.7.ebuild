# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-vcs/cvs-repo/gentoo-x86/dev-vcs/cvsd/cvsd-1.0.7.ebuild,v 1.2 2012/06/07 21:48:58 zmedico Exp $

inherit eutils user

DESCRIPTION="CVS pserver daemon."
HOMEPAGE="http://ch.tudelft.nl/~arthur/cvsd/"
SRC_URI="http://ch.tudelft.nl/~arthur/cvsd/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ~sparc x86"
IUSE="tcpd"

DEPEND="tcpd? ( >=sys-apps/tcp-wrappers-7.6 )"
RDEPEND="${DEPEND}
	>=dev-lang/perl-5.8.0
	>=dev-vcs/cvs-1.11.6"

pkg_setup() {
	enewgroup cvsd
	enewuser cvsd -1 -1 /var/lib/cvsd cvsd
}

src_compile() {
	econf $(use_with tcpd libwrap) || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dosed 's:^Repos:# Repos:g' /etc/cvsd/cvsd.conf
	keepdir /var/lib/cvsd

	dodoc AUTHORS ChangeLog FAQ INSTALL NEWS README TODO

	newinitd "${FILESDIR}"/cvsd.rc6 ${PN}
}

pkg_postinst() {
	elog "To configure cvsd please read the README in "
	elog "/usr/share/doc/${PF}/"
}
