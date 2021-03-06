# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/games-fps/cvs-repo/gentoo-x86/games-fps/rott/rott-1.1.1.ebuild,v 1.3 2010/03/18 05:43:20 mr_bones_ Exp $

EAPI=2
inherit eutils games

DESCRIPTION="Rise of the Triad for Linux!"
HOMEPAGE="http://www.icculus.org/rott/"
SRC_URI="http://www.icculus.org/rott/releases/${P}.tar.gz
	demo? ( http://filesingularity.timedoctor.org/swdata.zip )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="demo"

RDEPEND="media-libs/libsdl[audio,joystick,video]
	media-libs/sdl-mixer"
DEPEND="${RDEPEND}
	app-arch/unzip"

S=${WORKDIR}/${P}/rott

src_prepare() {
	use demo || epatch "${FILESDIR}"/${P}-full-version.patch
	cd "${S}"
	sed -i \
		-e '/^CC =/d' \
		Makefile \
		|| die "sed failed"
	emake clean || die
}

src_compile() {
	emake -j1 \
		EXTRACFLAGS="${CFLAGS} -DDATADIR=\\\"${GAMES_DATADIR}/${PN}/\\\"" \
		|| die "emake failed"
}

src_install() {
	dogamesbin rott || die "dogamesbin failed"
	dodoc ../doc/*.txt ../README
	doman ../doc/rott.6
	if use demo ; then
		cd "${WORKDIR}"
		insinto "${GAMES_DATADIR}"/${PN}
		doins *.dmo huntbgin.* remote1.rts || die "doins failed"
	fi
	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst
	if ! use demo ; then
		elog "To play the full version, just copy the"
		elog "data files to ${GAMES_DATADIR}/${PN}/"
	fi
}
