# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/games-puzzle/cvs-repo/gentoo-x86/games-puzzle/hoh-bin/hoh-bin-1.01.ebuild,v 1.12 2009/11/03 16:20:15 mr_bones_ Exp $

inherit eutils games

DESCRIPTION="PC remake of the spectrum game, Head Over Heels"
HOMEPAGE="http://retrospec.sgn.net/games/hoh/"
SRC_URI="http://retrospec.sgn.net/download.php?id=63\&path=games/hoh/bin/hohlin-${PV/./}.tar.bz2"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="strip"

DEPEND="x11-libs/libX11
	amd64? ( >=app-emulation/emul-linux-x86-xlibs-1.0 )"

S=${WORKDIR}/hoh-install-${PV}

src_compile() {
	cat > "${T}/hoh" <<-EOF
		#!/bin/bash
		export LD_LIBRARY_PATH="${GAMES_PREFIX_OPT}/HoH/data/runtime"
		cd "${GAMES_PREFIX_OPT}/HoH/data"
		exec ./HoH \$@
EOF
}

src_install() {
	local DATADIR="${GAMES_PREFIX_OPT}/HoH/data"
	local DOCDIR="${GAMES_PREFIX_OPT}/HoH/docs"

	dogamesbin "${T}/hoh" || die "dogames bin failed"
	dodir "${DATADIR}" "${DOCDIR}"
	cp -pPRf data/* "${D}/${DATADIR}/" || die "cp failed (data)"
	cp -pPRf docs/* "${D}/${DOCDIR}/"  || die "cp failed (docs)"
	make_desktop_entry hoh "Head Over Heels"
	prepgamesdirs
}
