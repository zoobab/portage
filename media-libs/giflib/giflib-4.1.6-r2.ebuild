# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-libs/cvs-repo/gentoo-x86/media-libs/giflib/giflib-4.1.6-r2.ebuild,v 1.2 2012/05/09 00:23:21 aballier Exp $

EAPI=4

inherit eutils libtool

DESCRIPTION="Library to handle, display and manipulate GIF images"
HOMEPAGE="http://sourceforge.net/projects/giflib/"
SRC_URI="mirror://sourceforge/giflib/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE="rle static-libs X"

DEPEND="X? (
		x11-libs/libXt
		x11-libs/libX11
		x11-libs/libICE
		x11-libs/libSM
	)
	rle? ( media-libs/urt )"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-gif2rle.patch
	epatch "${FILESDIR}"/${P}-giffix-null-Extension-fix.patch
	elibtoolize
	epunt_cxx
}

src_configure() {
	local myconf=""

	# prevent circular depend #111455
	if has_version media-libs/urt ; then
		myconf="${myconf} $(use_enable rle)"
	else
		myconf="${myconf} --disable-rle"
	fi

	econf \
		--disable-gl \
		$(use_enable static-libs static) \
		$(use_enable X x11) \
		${myconf}
}

src_install() {
	default
	# for static libs the .la file is required if build with +rle or +X
	use static-libs || find "${ED}" -name '*.la' -exec rm -f {} +
	dodoc AUTHORS BUGS ChangeLog NEWS ONEWS README TODO doc/*.txt
	dohtml -r doc
}
