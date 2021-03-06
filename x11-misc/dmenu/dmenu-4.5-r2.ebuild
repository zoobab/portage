# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-misc/cvs-repo/gentoo-x86/x11-misc/dmenu/dmenu-4.5-r2.ebuild,v 1.1 2012/08/10 16:04:10 jer Exp $

EAPI="4"

inherit eutils toolchain-funcs

DESCRIPTION="a generic, highly customizable, and efficient menu for the X Window System"
HOMEPAGE="http://tools.suckless.org/dmenu/"
SRC_URI="http://dl.suckless.org/tools/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~x86 ~x86-fbsd"
IUSE="xft xinerama"

DEPEND="
	x11-libs/libX11
	xft? ( x11-libs/libXft )
	xinerama? ( x11-libs/libXinerama )
"
RDEPEND="${DEPEND}"

src_prepare() {
	# Respect our flags
	sed -i \
		-e '/^CFLAGS/{s|=.*|+= -ansi -pedantic -Wall ${INCS} ${CPPFLAGS}|}' \
		-e 's|LDFLAGS  = -s|LDFLAGS  +=|' \
		-e 's|XINERAMALIBS  =|XINERAMALIBS  ?=|' \
		-e 's|XINERAMAFLAGS =|XINERAMAFLAGS ?=|' \
		config.mk || die
	# Make make verbose
	sed -i \
		-e 's|^	@|	|g' \
		-e '/^	echo/d' \
		Makefile || die
	use xft && epatch "${FILESDIR}"/${PN}-4.5-xft.patch
}

src_compile() {
	if use xinerama; then
		emake CC=$(tc-getCC)
	else
		emake CC=$(tc-getCC) XINERAMAFLAGS="" XINERAMALIBS=""
	fi
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}
