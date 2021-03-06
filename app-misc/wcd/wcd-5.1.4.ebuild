# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-misc/cvs-repo/gentoo-x86/app-misc/wcd/wcd-5.1.4.ebuild,v 1.3 2012/03/13 13:04:06 jlec Exp $

EAPI=4

inherit eutils toolchain-funcs

DESCRIPTION="Wherever Change Directory"
HOMEPAGE="http://www.xs4all.nl/~waterlan/#WCD_ANCHOR"
SRC_URI="http://www.xs4all.nl/~waterlan/${P}-src.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
LICENSE="GPL-2"
IUSE="ncurses nls unicode"

DEPEND="app-text/ghostscript-gpl"

src_prepare() {
	epatch "${FILESDIR}"/${PV}-gentoo.patch
	tc-export CC
}

src_compile() {
	local mycompile
	use nls || mycompile="${mycompile} ENABLE_NLS="
	use ncurses || mycompile="${mycompile} CURSES="
	use unicode && mycompile="${mycompile} UCS=1"
	emake \
		${mycompile}
}
