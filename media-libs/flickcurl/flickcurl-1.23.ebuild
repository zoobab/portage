# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-libs/cvs-repo/gentoo-x86/media-libs/flickcurl/flickcurl-1.23.ebuild,v 1.1 2012/09/08 09:18:53 radhermit Exp $

EAPI="4"

inherit autotools eutils

DESCRIPTION="C library for the Flickr API"
HOMEPAGE="http://librdf.org/flickcurl/"
SRC_URI="http://download.dajobe.org/flickcurl/${P}.tar.gz"

LICENSE="|| ( LGPL-2.1 GPL-2 Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc raptor static-libs"

RDEPEND=">=net-misc/curl-7.10.0
	>=dev-libs/libxml2-2.6.8:2
	raptor? ( media-libs/raptor:2 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	if ! use doc ; then
		# Only install html documentation when the use flag is enabled
		sed -i -e '/gtk-doc.make/d' \
			-e 's:+=:=:' docs/Makefile.am || die
	fi

	eautoreconf
}

src_configure() {
	econf \
		$(use_with raptor) \
		$(use_enable static-libs static)
}

src_install() {
	emake DESTDIR="${D}" TARGET_DIR=/usr/share/doc/${PF}/html install
	dodoc AUTHORS ChangeLog NEWS README
	prune_libtool_files
}
