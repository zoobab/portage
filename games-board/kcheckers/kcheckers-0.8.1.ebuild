# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/games-board/cvs-repo/gentoo-x86/games-board/kcheckers/kcheckers-0.8.1.ebuild,v 1.8 2011/10/19 17:14:43 mr_bones_ Exp $

EAPI=2
inherit eutils qt4-r2 games

DESCRIPTION="Qt version of the classic boardgame checkers"
HOMEPAGE="http://qcheckers.sourceforge.net/"
SRC_URI="mirror://gentoo/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc x86"
IUSE=""

DEPEND="x11-libs/qt-gui:4"

src_prepare() {
	sed -i \
		-e "s:/usr/local:${GAMES_DATADIR}:" \
		common.h || die "sed common.h failed"

	sed -i \
		-e "s:PREFIX\"/share:\"${GAMES_DATADIR}:" \
		main.cc toplevel.cc || die "sed failed"
}

src_configure() {
	qt4-r2_src_configure
}

src_install() {
	dogamesbin kcheckers || die

	insinto "${GAMES_DATADIR}"/${PN}
	doins -r i18n/* themes || die

	newicon icons/biglogo.png ${PN}.png
	make_desktop_entry ${PN} KCheckers

	dodoc AUTHORS ChangeLog FAQ README TODO
	prepgamesdirs
}
