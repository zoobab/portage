# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-libs/cvs-repo/gentoo-x86/net-libs/liboping/liboping-1.6.2.ebuild,v 1.1 2012/06/11 19:21:44 dilfridge Exp $

EAPI=4

inherit base autotools

DESCRIPTION="C library and ncurses based program to generate ICMP echo requests and ping multiple hosts at once"
HOMEPAGE="http://verplant.org/liboping"
SRC_URI="http://verplant.org/${PN}/files/${P}.tar.bz2"

LICENSE="LGPL-2.1 GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="perl"

DEPEND="
	sys-libs/ncurses
	perl? ( dev-lang/perl sys-devel/libperl  )
"
RDEPEND=${DEPEND}

PATCHES=( "${FILESDIR}/${P}-nouidmagic.patch" )

src_prepare() {
	base_src_prepare
	eautoreconf
}

src_configure() {
	econf \
		$(use_with perl perl-bindings INSTALLDIRS=vendor) \
		--disable-static
}

src_install() {
	default
	find "${D}" -name '*.la'  -delete || die

	fperms u+s,og-r /usr/bin/oping
	fperms u+s,og-r /usr/bin/noping
}
