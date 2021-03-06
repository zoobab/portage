# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/games-action/cvs-repo/gentoo-x86/games-action/phobiaii/phobiaii-1.1.ebuild,v 1.16 2012/09/24 00:22:57 vapier Exp $

inherit eutils games

MY_P="linuxphobia-${PV}"
DESCRIPTION="Just a moment ago, you were safe inside your ship, behind five inch armour"
HOMEPAGE="http://www.lynxlabs.com/games/linuxphobia/index.html"
SRC_URI="http://www.lynxlabs.com/games/linuxphobia/${MY_P}-i386.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="media-libs/sdl-mixer
	media-libs/libsdl
	x86? ( sys-libs/lib-compat )
	amd64? ( app-emulation/emul-linux-x86-compat )"

S=${WORKDIR}/${MY_P}

QA_PRESTRIPPED="opt/phobiaii/linuxphobia"
QA_FLAGS_IGNORED="opt/phobiaii/linuxphobia"

src_install() {
	local dir=${GAMES_PREFIX_OPT}/${PN}
	games_make_wrapper phobiaII ./linuxphobia "${dir}"
	newicon phobia2.ico ${PN}.ico
	make_desktop_entry phobiaII "Phobia II" /usr/share/pixmaps/${PN}.ico
	insinto "${dir}"
	doins -r * || die "doins failed"
	rm -rf "${D}/${dir}"/{*.desktop,*.sh,/pics/.xvpics}
	fperms 750 "${dir}"/linuxphobia
	prepgamesdirs
}
