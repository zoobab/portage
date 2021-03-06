# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-mail/cvs-repo/gentoo-x86/net-mail/ripole/ripole-0.2.2.ebuild,v 1.3 2012/02/24 15:00:38 phajdan.jr Exp $

EAPI=4

inherit eutils toolchain-funcs

DESCRIPTION="Program/library to pull out attachment from OLE2 data files"
HOMEPAGE="http://www.pldaniels.com/ripole/"
SRC_URI="http://www.pldaniels.com/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 hppa x86"
IUSE=""

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.2.0-ldflags.patch
}

src_compile() {
	emake CFLAGS="${CFLAGS}" CC="$(tc-getCC)"
}

src_install() {
	dobin ripole
	dodoc CHANGELOG README CONTRIBUTORS
}
