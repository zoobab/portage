# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-libs/cvs-repo/gentoo-x86/net-libs/libmicrohttpd/libmicrohttpd-0.9.19.ebuild,v 1.5 2012/06/25 01:00:16 blueness Exp $

EAPI="4"

MY_P=${P/_/}

DESCRIPTION="A small C library that makes it easy to run an HTTP server as part of another application."
HOMEPAGE="http://www.gnu.org/software/libmicrohttpd/"
SRC_URI="mirror://gnu/${PN}/${MY_P}.tar.gz"

IUSE="messages ssl static-libs test"
KEYWORDS="amd64 x86"
LICENSE="LGPL-2.1"
SLOT="0"

RDEPEND="ssl? (
		dev-libs/libgcrypt
		net-libs/gnutls
	)
	net-misc/curl"
# Some tests fail if curl is built against nss, bug #334067
DEPEND="${RDEPEND}
	test?	(
		ssl? ( || (
			>=net-misc/curl-7.21[ssl,-nss]
			>=net-misc/curl-7.21[ssl,gnutls]
		) )
	)"

S=${WORKDIR}/${MY_P}

DOCS="AUTHORS NEWS README ChangeLog"

src_configure() {
	econf \
		--enable-curl \
		$(use_enable messages) \
		$(use_enable ssl https) \
		$(use_with ssl gnutls) \
		$(use_enable static-libs static)
}

src_install() {
	default

	use static-libs || find "${ED}" -name '*.la' -exec rm -f {} +
}
