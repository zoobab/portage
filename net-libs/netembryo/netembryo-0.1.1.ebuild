# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-libs/cvs-repo/gentoo-x86/net-libs/netembryo/netembryo-0.1.1.ebuild,v 1.3 2012/05/05 02:54:26 jdhore Exp $

EAPI=2
inherit multilib

DESCRIPTION="a network abstraction library"
HOMEPAGE="http://lscube.org/projects/netembryo/"
SRC_URI="http://lscube.org/files/downloads/${PN}/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ipv6 +sctp test"

RDEPEND=">=dev-libs/openssl-0.9.8
	sctp? ( net-misc/lksctp-tools )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	test? ( >=dev-libs/glib-2.20:2
		sys-apps/gawk
		dev-util/ctags )"

src_configure() {
	econf \
		--disable-dependency-tracking \
		--disable-static \
		$(use_enable ipv6) \
		$(use_enable sctp) \
		$(use_enable test tests)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog README TODO
	find "${D}"usr/$(get_libdir) -name '*.la' -delete
}
