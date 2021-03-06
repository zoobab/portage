# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-util/cvs-repo/gentoo-x86/dev-util/dwdiff/dwdiff-2.0.2.ebuild,v 1.1 2012/01/03 09:49:23 ssuominen Exp $

EAPI=4
inherit toolchain-funcs

DESCRIPTION="A front-end for the diff program that operates at the word level instead of the line level"
HOMEPAGE="http://os.ghalkes.nl/dwdiff.html"
SRC_URI="http://os.ghalkes.nl/dist/${P}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="nls"

COMMON_DEPEND="dev-libs/icu"
RDEPEND="${COMMON_DEPEND}
	sys-apps/diffutils"
DEPEND="${COMMON_DEPEND}
	nls? ( sys-devel/gettext )"

src_prepare() {
	sed -i \
		-e '/INSTALL/s:COPYING::' \
		Makefile.in || die
}

src_configure() {
	./configure \
		--prefix=/usr \
		$(use_with nls gettext) || die
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"
}

src_install() {
	emake prefix="${D}/usr" docdir="${D}/usr/share/doc/${PF}" install
}
