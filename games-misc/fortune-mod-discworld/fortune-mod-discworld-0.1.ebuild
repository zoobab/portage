# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/games-misc/cvs-repo/gentoo-x86/games-misc/fortune-mod-discworld/fortune-mod-discworld-0.1.ebuild,v 1.6 2010/12/12 17:48:51 grobian Exp $

MY_P=${PN/-mod/}
DESCRIPTION="Quotes from Discworld novels"
HOMEPAGE="http://www.splitbrain.org/projects/fortunes/discworld"
SRC_URI="http://www.splitbrain.org/_media/projects/fortunes/${MY_P}.tgz"

LICENSE="fairuse"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
IUSE=""
RESTRICT="mirror"

RDEPEND="games-misc/fortune-mod"

S=${WORKDIR}/${MY_P}

src_install() {
	insinto /usr/share/fortune
	doins discworld discworld.dat || die
}
