# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/games-misc/cvs-repo/gentoo-x86/games-misc/xpenguins/xpenguins-2.2-r1.ebuild,v 1.5 2007/03/10 09:06:35 nyhm Exp $

inherit games

THEMES_VERSION="1.0"
DESCRIPTION="Cute little penguins invading your desktop"
HOMEPAGE="http://xpenguins.seul.org/"
SRC_URI="http://xpenguins.seul.org/${P}.tar.gz
	http://xpenguins.seul.org/xpenguins_themes-${THEMES_VERSION}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ppc sparc x86"
IUSE=""

RDEPEND="x11-libs/libXpm"
DEPEND="${RDEPEND}
	x11-proto/xextproto"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r ../themes/ || die "doins failed"
	prepgamesdirs
}
