# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sci-calculators/cvs-repo/gentoo-x86/sci-calculators/pcalc/pcalc-1.3.ebuild,v 1.4 2011/08/07 13:08:55 vapier Exp $

inherit toolchain-funcs

DESCRIPTION="the programmers calculator"
HOMEPAGE="http://pcalc.sourceforge.net/"
SRC_URI="mirror://sourceforge/pcalc/${P}.tar.lzma"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86"
IUSE=""

DEPEND="sys-devel/flex"
RDEPEND=""

src_compile() {
	tc-export CC
	emake pcalc || die
}

src_install() {
	emake install DESTDIR="${D}" || die
	dodoc AUTHORS ChangeLog EXAMPLE README
}
