# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-shells/cvs-repo/gentoo-x86/app-shells/rrs/rrs-1.70-r1.ebuild,v 1.2 2012/10/11 09:26:19 pinkbyte Exp $

EAPI=4

inherit eutils toolchain-funcs

DESCRIPTION="Reverse Remote Shell"
HOMEPAGE="http://freecode.com/projects/rrs"
SRC_URI="http://www.cycom.se/uploads/36/19/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="ssl"

DEPEND="ssl? ( dev-libs/openssl )"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/"${P}"-asneeded.patch
	sed -i -e "s/-s //g" Makefile || die
}

src_compile() {
	local target=""
	use ssl || target="-nossl"

	emake generic${target} CFLAGS="${CFLAGS}" LDEXTRA="${LDFLAGS}" CC="$(tc-getCC)"
}

src_install() {
	dobin rrs
	dodoc CHANGES README
	doman rrs.1
}
