# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/games-puzzle/cvs-repo/gentoo-x86/games-puzzle/lpairs/lpairs-1.0.4.ebuild,v 1.6 2009/04/14 09:50:54 armin76 Exp $

EAPI=2
inherit eutils games

DESCRIPTION="A classical memory game"
HOMEPAGE="http://lgames.sourceforge.net/index.php?project=LPairs"
SRC_URI="mirror://sourceforge/lgames/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE="nls"

RDEPEND="media-libs/libsdl
	nls? ( virtual/libintl )"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )"

src_prepare() {
	sed -i \
		-e 's:$localedir:/usr/share/locale:' \
		-e 's:$(localedir):/usr/share/locale:' \
		configure po/Makefile.in.in \
		|| die "sed failed"
}

src_configure() {
	egamesconf \
		--datadir="${GAMES_DATADIR_BASE}" \
		$(use_enable nls)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README AUTHORS TODO ChangeLog
	doicon lpairs.png
	make_desktop_entry lpairs LPairs
	prepgamesdirs
}
