# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-nntp/cvs-repo/gentoo-x86/net-nntp/brag/brag-1.4.1.ebuild,v 1.3 2012/03/19 19:12:18 armin76 Exp $

IUSE=""

DESCRIPTION="Brag collects and assembles multipart binary attachments from newsgroups."
SRC_URI="mirror://sourceforge/brag/${P}.tar.gz"
HOMEPAGE="http://brag.sourceforge.net/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ppc x86"

RDEPEND="dev-lang/tcl
	app-text/uudeview"

src_compile() {
	true
}

src_install() {
	dobin brag
	dodoc CHANGES README
	doman brag.1
}
