# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-util/cvs-repo/gentoo-x86/dev-util/fix-la-relink-command/fix-la-relink-command-0.1.1.ebuild,v 1.8 2012/05/30 00:48:21 aballier Exp $

EAPI="4"

DESCRIPTION="Helps prevent .la files from relinking to libraries outside a build tree"
HOMEPAGE="http://dev.gentoo.org/~tetromino/distfiles/${PN}"
SRC_URI="http://dev.gentoo.org/~tetromino/distfiles/${PN}/${P}.tar.xz"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND="dev-lang/perl
	virtual/perl-Getopt-Long"
DEPEND="${RDEPEND}
	app-arch/xz-utils"

src_install() {
	dobin ${PN}
	doman ${PN}.1
	dodoc NEWS
}
