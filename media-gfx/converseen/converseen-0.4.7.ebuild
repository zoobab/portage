# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-gfx/cvs-repo/gentoo-x86/media-gfx/converseen/converseen-0.4.7.ebuild,v 1.2 2011/12/12 19:11:23 maksbotan Exp $

EAPI="4"
LANGSLONG="cs_CZ de_DE fr_FR hu_HU it_IT pl_PL pt_BR tr_TR"
LANGS="es_CL"

inherit cmake-utils

DESCRIPTION="Batch image converter and resizer based on ImageMagick"
HOMEPAGE="http://converseen.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"
for x in ${LANGS}; do
	IUSE="${IUSE} linguas_${x}"
done
for x in ${LANGSLONG}; do
	IUSE="${IUSE} linguas_${x%_*}"
done

RDEPEND="
	x11-libs/qt-gui:4
	|| ( media-gfx/imagemagick media-gfx/graphicsmagick[imagemagick] )
"
DEPEND="${RDEPEND}"

DOCS="README"

src_prepare() {
	for x in ${LANGSLONG}; do
		if use !linguas_${x%_*}; then
			rm -f "loc/${PN}_${x}."* || die
			sed -i -e "\,/${PN}_${x}\...,d" CMakeLists.txt || die
		fi
	done
	for x in ${LANGS}; do
		if use !linguas_${x}; then
			rm -f "loc/${PN}_${x}."* || die
			sed -i -e "\,/${PN}_${x}\...,d" CMakeLists.txt || die
		fi
	done
}
