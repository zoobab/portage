# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-misc/cvs-repo/gentoo-x86/net-misc/jwhois/jwhois-4.0-r1.ebuild,v 1.2 2012/08/18 18:42:29 vapier Exp $

EAPI="4"

inherit eutils

DESCRIPTION="Advanced Internet Whois client capable of recursive queries"
HOMEPAGE="http://www.gnu.org/software/jwhois/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="idn nls"

RDEPEND="idn? ( net-dns/libidn )"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-connect-logic.patch #208875
}

src_configure() {
	econf \
		--localstatedir=/var/cache \
		--without-cache \
		$(use_enable nls) \
		$(use_with idn libidn)
}
