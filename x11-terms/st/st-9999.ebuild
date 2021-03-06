# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-terms/cvs-repo/gentoo-x86/x11-terms/st/st-9999.ebuild,v 1.5 2012/03/07 18:17:30 jer Exp $

EAPI=3

inherit mercurial savedconfig toolchain-funcs

DESCRIPTION="simple terminal implementation for X"
HOMEPAGE="http://st.suckless.org/"
EHG_REPO_URI="http://hg.suckless.org/st"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="x11-libs/libX11"
DEPEND="${RDEPEND}
	sys-libs/ncurses"

pkg_setup() {
	elog "Please ensure an usable font is installed, like"
	elog "    media-fonts/corefonts"
	elog "    media-fonts/dejavu"
	elog "    media-fonts/urw-fonts"
}

src_prepare() {
	sed -e '/^CFLAGS/s:[[:space:]]-Wall[[:space:]]: :' \
		-e '/^CFLAGS/s:[[:space:]]-O[^[:space:]]*[[:space:]]: :' \
		-e '/^LDFLAGS/{s:[[:space:]]-s[[:space:]]: :}' \
		-i config.mk || die
	tc-export CC

	restore_config config.h
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install || die
	tic -s -o "${ED}"/usr/share/terminfo st.info || die
	dodoc TODO || die

	save_config config.h
}
