# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/games-misc/cvs-repo/gentoo-x86/games-misc/fortune-mod-debilneho/fortune-mod-debilneho-0.1.ebuild,v 1.10 2010/12/12 18:14:43 grobian Exp $

MY_PN=${PN/mod-/}
DESCRIPTION="Quotation's by several people (mostly from Slovakia)"
HOMEPAGE="http://megac.info"
SRC_URI="http://megac.info/fortune-debilneho.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
IUSE=""

RDEPEND="games-misc/fortune-mod"

S=${WORKDIR}/${MY_PN}

src_install() {
	insinto /usr/share/fortune
	doins debilneho debilneho.dat || die
}
