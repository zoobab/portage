# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-libs/cvs-repo/gentoo-x86/media-libs/libzen/libzen-0.4.27.ebuild,v 1.6 2012/08/04 10:50:52 ago Exp $

EAPI="4"

inherit autotools multilib eutils

MY_PN="ZenLib"
DESCRIPTION="Shared library for libmediainfo and mediainfo"
HOMEPAGE="http://sourceforge.net/projects/zenlib"
SRC_URI="mirror://sourceforge/zenlib/${MY_PN}%20-%20Sources/${PV}/${PN}_${PV}.tar.bz2"

LICENSE="as-is ZLIB"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc static-libs"

DEPEND="virtual/pkgconfig
	doc? ( app-doc/doxygen )"

S=${WORKDIR}/${MY_PN}/Project/GNU/Library

src_prepare() {
	sed -i -e "s:-O2::" configure.ac
	eautoreconf
}

src_configure() {
	econf \
		--enable-unicode \
		--enable-shared \
		$(use_enable static-libs static)
}

src_compile() {
	default

	if use doc ; then
		cd "${WORKDIR}"/${MY_PN}/Source/Doc
		doxygen Doxyfile || die
	fi
}

src_install() {
	default

	# remove since the pkgconfig file should be used instead
	rm "${D}"/usr/bin/libzen-config

	insinto /usr/$(get_libdir)/pkgconfig
	doins ${PN}.pc

	for x in ./ Format/Html Format/Http HTTP_Client ; do
		insinto /usr/include/${MY_PN}/${x}
		doins "${WORKDIR}"/${MY_PN}/Source/${MY_PN}/${x}/*.h
	done

	dodoc "${WORKDIR}"/${MY_PN}/History.txt
	if use doc ; then
		dohtml "${WORKDIR}"/${MY_PN}/Doc/*
	fi

	prune_libtool_files
}
