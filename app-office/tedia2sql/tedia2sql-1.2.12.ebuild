# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-office/cvs-repo/gentoo-x86/app-office/tedia2sql/tedia2sql-1.2.12.ebuild,v 1.2 2007/11/25 17:22:48 drac Exp $

DESCRIPTION="Convert database ERD designed in Dia into SQL DDL scripts."
HOMEPAGE="http://tedia2sql.tigris.org"
SRC_URI="http://tedia2sql.tigris.org/files/documents/282/19423/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="doc"

DEPEND=">=dev-lang/perl-5.8
	>=dev-perl/XML-DOM-1.43
	>=virtual/perl-Digest-MD5-2.36"

S=${WORKDIR}/${PN}

src_install() {
	insinto /etc
	doins tedia2sqlrc

	dobin tedia2sql
	dodoc README
	use doc && dohtml -A sql -A dia www/*
}
