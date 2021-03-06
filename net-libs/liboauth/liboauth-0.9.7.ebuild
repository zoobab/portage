# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-libs/cvs-repo/gentoo-x86/net-libs/liboauth/liboauth-0.9.7.ebuild,v 1.3 2012/09/23 05:52:42 blueness Exp $

EAPI=4

DESCRIPTION="C library implementing the OAuth secure authentication protocol"
HOMEPAGE="http://liboauth.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz
	http://liboauth.sourceforge.net/pool/${P}.tar.gz"

LICENSE="|| ( GPL-2 MIT )"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~x64-macos"
IUSE="curl doc bindist +nss"

REQUIRED_USE="bindist? ( nss )"

CDEPEND="
	nss? ( dev-libs/nss
		curl? ( || ( net-misc/curl[ssl,curl_ssl_nss] net-misc/curl[-ssl] ) )
	)

	!nss? ( dev-libs/openssl
		curl? ( || ( net-misc/curl[ssl,curl_ssl_openssl] net-misc/curl[-ssl] ) )
	)

	net-misc/curl
"

RDEPEND="${CDEPEND}"

DEPEND="${CDEPEND}
	doc? (
		app-doc/doxygen
		media-gfx/graphviz
		media-fonts/freefont-ttf
	)
	virtual/pkgconfig"

src_configure() {
	local myconf=

	if use nss || use bindist; then
		myconf="${myconf} --enable-nss"
	else
		myconf="${myconf} --disable-nss"
	fi

	econf \
		--disable-dependency-tracking \
		--enable-fast-install \
		--disable-static \
		$(use_enable !curl curl) \
		$(use_enable curl libcurl) \
		${myconf}
}

src_compile() {
	emake

	if use doc ; then
		# make sure fonts are found
		export DOTFONTPATH="${EPREFIX}"/usr/share/fonts/freefont-ttf
		emake dox
	fi
}

src_test() {
	# explicitly allow parallel test build
	emake check
}

DOCS=( AUTHORS ChangeLog LICENSE.OpenSSL NEWS README )

src_install() {
	default

	if use doc; then
		dohtml -r doc/html/*
	fi
}
