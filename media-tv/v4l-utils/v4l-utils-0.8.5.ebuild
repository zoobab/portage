# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-tv/cvs-repo/gentoo-x86/media-tv/v4l-utils/v4l-utils-0.8.5.ebuild,v 1.4 2011/12/30 13:16:34 ssuominen Exp $

EAPI=4
inherit toolchain-funcs qt4-r2

DESCRIPTION="Separate utilities ebuild from upstream v4l-utils package"
HOMEPAGE="http://git.linuxtv.org/v4l-utils.git"
SRC_URI="http://linuxtv.org/downloads/v4l-utils/${P}.tar.bz2"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE="qt4"

RDEPEND=">=media-libs/libv4l-${PV}
	qt4? ( x11-libs/qt-gui:4 )
	!media-tv/v4l2-ctl
	!<media-tv/ivtv-utils-1.4.0-r2"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${P}/utils

src_prepare() {
	use qt4 || sed -i -e 's:which $$QMAKE:which dISaBlEd:' Makefile
}

src_configure() {
	tc-export CC CXX
	if use qt4; then
		cd qv4l2
		eqmake4 qv4l2.pro
	fi
}

src_compile() {
	emake CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install

	dodoc ../README
	newdoc libv4l2util/TODO TODO.libv4l2util
	newdoc xc3028-firmware/README README.xc3028-firmware
	newdoc libmedia_dev/README README.libmedia_dev
}
