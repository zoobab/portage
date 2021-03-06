# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-util/cvs-repo/gentoo-x86/dev-util/shc/shc-3.8.7.ebuild,v 1.6 2012/10/14 18:53:35 armin76 Exp $

EAPI="2"

inherit toolchain-funcs

DESCRIPTION="A (shell-) script compiler/scrambler"
HOMEPAGE="http://www.datsi.fi.upm.es/~frosal"
SRC_URI="http://www.datsi.fi.upm.es/~frosal/sources/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ppc ~sparc x86"
IUSE=""

RESTRICT="test"

src_prepare() {
	# respect LDFLAGS
	sed -i Makefile -e 's:$(CC) $(CFLAGS):& $(LDFLAGS):' || die
}

src_compile() {
	## the "test"-target leads to an access-violation -> so we skip it
	## as it's only for demonstration purposes anyway.
	emake CC=$(tc-getCC) CFLAGS="${CFLAGS}" shc || die
}

src_install() {
	dobin shc || die
	doman shc.1 || die
	dodoc shc.README CHANGES || die
}
