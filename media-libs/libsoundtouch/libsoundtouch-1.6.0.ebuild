# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-libs/cvs-repo/gentoo-x86/media-libs/libsoundtouch/libsoundtouch-1.6.0.ebuild,v 1.14 2012/08/06 00:52:47 blueness Exp $

EAPI=4
inherit autotools eutils flag-o-matic

MY_PN=${PN/lib}

DESCRIPTION="Audio processing library for changing tempo, pitch and playback rates."
HOMEPAGE="http://www.surina.net/soundtouch/"
SRC_URI="http://www.surina.net/soundtouch/${P/lib}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ~arm hppa ~mips ppc ppc64 x86"
IUSE="sse2 static-libs"

S=${WORKDIR}/${MY_PN}

src_prepare() {
	epatch "${FILESDIR}"/${P}-flags.patch
	sed -i -e "s:^\(pkgdoc_DATA=\)COPYING.TXT :\1:" Makefile.am || die
	eautoreconf

	if use sse2; then
		append-flags -msse2
	else
		sed -i -e '/#define SOUNDTOUCH_ALLOW_X86_OPTIMIZATIONS/d' \
			include/STTypes.h || die
	fi
}

src_configure() {
	econf \
		--enable-shared \
		--disable-integer-samples \
		$(use_enable static-libs static)
}

src_compile() {
	emake CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
}

src_install() {
	emake DESTDIR="${D}" pkgdocdir="${EPREFIX}/usr/share/doc/${PF}/html" install
	find "${ED}" -name '*.la' -exec rm -f {} +
}
