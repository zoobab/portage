# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sci-libs/cvs-repo/gentoo-x86/sci-libs/liborigin/liborigin-20110829.ebuild,v 1.2 2011/10/30 19:30:57 dilfridge Exp $

EAPI=4

inherit eutils qt4-r2

DESCRIPTION="Library for reading OriginLab OPJ project files"
HOMEPAGE="http://soft.proindependent.com/liborigin2/"
SRC_URI="http://dev.gentoo.org/~dilfridge/distfiles/${PN}2-${PV}.zip"

LICENSE="GPL-3"
SLOT="2"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc"

RDEPEND="dev-libs/boost"
DEPEND="${RDEPEND}
	app-arch/unzip
	x11-libs/qt-gui:4
	dev-cpp/tree
	doc? ( app-doc/doxygen )"

DOCS="readme FORMAT"

S="${WORKDIR}"/${PN}${SLOT}

src_prepare() {
	mv liborigin2.pro liborigin.pro || die
	qt4-r2_src_prepare
	cat >> liborigin.pro <<-EOF
		INCLUDEPATH += "${EPREFIX}/usr/include/tree"
		headers.files = \$\$HEADERS
		headers.path = "${EPREFIX}/usr/include/liborigin2"
		target.path = "${EPREFIX}/usr/$(get_libdir)"
		INSTALLS = target headers
	EOF
	# use system one
	rm -f tree.hh || die
}

src_compile() {
	qt4-r2_src_compile
	if use doc; then
		cd doc
		doxygen Doxyfile || die "doc generation failed"
	fi
}

src_install() {
	qt4-r2_src_install
	use doc && dohtml -r doc/html/*
}
