# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-devel/cvs-repo/gentoo-x86/sys-devel/crossdev/crossdev-20101011.ebuild,v 1.3 2011/07/05 06:48:09 vapier Exp $

EAPI="3"

if [[ ${PV} == "99999999" ]] ; then
	EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/crossdev.git"
	inherit git-2
	SRC_URI=""
	#KEYWORDS=""
else
	SRC_URI="mirror://gentoo/${P}.tar.xz
		http://dev.gentoo.org/~vapier/dist/${P}.tar.xz"
	KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
fi

DESCRIPTION="Gentoo Cross-toolchain generator"
HOMEPAGE="http://www.gentoo.org/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=">=sys-apps/portage-2.1
	app-shells/bash
	!sys-devel/crossdev-wrappers"
DEPEND="app-arch/xz-utils"

src_install() {
	emake install DESTDIR="${D}" || die
}
