# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-misc/cvs-repo/gentoo-x86/app-misc/mvcase/mvcase-0.1.ebuild,v 1.8 2008/03/29 13:50:25 coldwind Exp $

DESCRIPTION="A modified version of mv, used to convert filenames to lower/upper case"
HOMEPAGE="http://www.ibiblio.org/pub/Linux/utils/file"
SRC_URI="http://www.ibiblio.org/pub/Linux/utils/file/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ~x86"
IUSE=""

DEPEND="dev-libs/shhopt"

src_compile() {
	emake || die
}

src_install() {
	dobin mvcase || die
	doman mvcase.1
	dodoc INSTALL
}
