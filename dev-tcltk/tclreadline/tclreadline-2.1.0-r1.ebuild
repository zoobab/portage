# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-tcltk/cvs-repo/gentoo-x86/dev-tcltk/tclreadline/tclreadline-2.1.0-r1.ebuild,v 1.4 2011/12/15 12:15:03 ago Exp $

EAPI=4

inherit autotools-utils

DESCRIPTION="Readline extension to TCL"
HOMEPAGE="http://tclreadline.sf.net/"
SRC_URI="mirror://sourceforge/tclreadline/${P}.tar.gz"

LICENSE="BSD"
IUSE=""
SLOT="0"
KEYWORDS="~alpha amd64 ~ppc ~sparc x86"

DEPEND="
	dev-lang/tcl
	sys-libs/readline"
RDEPEND="${DEPEND}"

src_prepare() {
	autotools-utils_src_prepare
	eautoreconf
}
