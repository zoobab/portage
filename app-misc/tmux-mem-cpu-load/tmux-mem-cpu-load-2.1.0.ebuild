# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-misc/cvs-repo/gentoo-x86/app-misc/tmux-mem-cpu-load/tmux-mem-cpu-load-2.1.0.ebuild,v 1.3 2011/07/13 19:45:41 maekke Exp $

EAPI="3"

inherit cmake-utils

IUSE=""
if [[ ${PV} == *9999* ]]; then
	inherit git
	EGIT_REPO_URI=${EGIT_REPO_URI:-"git://github.com/thewtex/tmux-mem-cpu-load.git"}
	KEYWORDS=""
	SRC_URI=""
else
	KEYWORDS="amd64 x86"
	SRC_URI="http://www.github.com/thewtex/${PN}/tarball/v${PV} -> ${P}.tar.gz"
fi

DESCRIPTION="CPU, RAM memory, and load monitor for use with tmux"
HOMEPAGE="http://github.com/thewtex/tmux-mem-cpu-load/"

LICENSE="as-is"
SLOT="0"

src_prepare() {
	if [[ ${PV} == *9999* ]]; then
		git_src_prepare
	else
		cd "${WORKDIR}"/thewtex-${PN}-*
		S=$(pwd)
	fi
}

src_install() {
	cmake-utils_src_install
	dodoc README.rst || die
}
