# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-libs/cvs-repo/gentoo-x86/media-libs/libsfml/libsfml-1.6-r1.ebuild,v 1.5 2012/06/07 20:18:23 radhermit Exp $

EAPI=4

inherit eutils multilib toolchain-funcs

MY_P="SFML-${PV}"
DESCRIPTION="Simple and Fast Multimedia Library (SFML)"
HOMEPAGE="http://sfml.sourceforge.net/"
SRC_URI="mirror://sourceforge/sfml/${MY_P}-sdk-linux-32.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug doc examples static-libs"

DEPEND="media-libs/freetype:2
	media-libs/glew
	>=media-libs/libpng-1.4
	media-libs/libsndfile
	media-libs/mesa
	media-libs/openal
	sys-libs/zlib
	virtual/jpeg
	x11-libs/libX11
	x11-libs/libXrandr"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-destdir.patch \
		"${FILESDIR}"/${P}-deps-and-flags.patch \
		"${FILESDIR}"/${P}-gcc46.patch \
		"${FILESDIR}"/${P}-gcc47.patch \
		"${FILESDIR}"/${P}-libpng15.patch
}

src_compile() {
	local myconf
	use debug && myconf="$myconf DEBUGBUILD=yes"

	emake $myconf CPP=$(tc-getCXX) CC=$(tc-getCC)
	use static-libs && emake $myconf STATIC=yes CPP=$(tc-getCXX) CC=$(tc-getCC)
}

src_install() {
	emake DESTDIR="${D}" prefix=/usr libdir=/usr/$(get_libdir) install

	use static-libs && dolib.a lib/*.a
	use doc && dohtml doc/html/*

	if use examples ; then
		docompress -x /usr/share/doc/${PF}/examples
		local i
		for i in ftp opengl pong post-fx qt sockets sound sound_capture voip window wxwidgets X11 ; do
			insinto /usr/share/doc/${PF}/examples/$i
			doins samples/$i/*
		done
	fi
}
