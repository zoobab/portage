# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-video/cvs-repo/gentoo-x86/media-video/smplayer2/smplayer2-0.7.0_pre20111120.ebuild,v 1.2 2012/06/17 05:48:42 yngwin Exp $

EAPI="4"
LANGS="bg ca cs da de en_US es et eu fi fr gl hu it ja ka ko ku lt mk nl pl pt pt_BR sk sr sv tr zh_CN zh_TW"
LANGSLONG="ar_SY el_GR ro_RO ru_RU sl_SI uk_UA vi_VN"

inherit cmake-utils

DESCRIPTION="Qt4 GUI front-end for mplayer2"
HOMEPAGE="https://github.com/lachs0r/SMPlayer2"
SRC_URI="http://rion-overlay.googlecode.com/files/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~x86"
IUSE="debug +download-subs"
for x in ${LANGS}; do
	IUSE="${IUSE} linguas_${x}"
done
for x in ${LANGSLONG}; do
	IUSE="${IUSE} linguas_${x%_*}"
done

DEPEND="
	x11-libs/qt-gui:4
	download-subs? ( dev-libs/quazip )
"
RDEPEND="${DEPEND}
	media-video/mplayer2[libass,png]
"

src_configure() {
	# linguas
	local langs x
	for x in ${LANGS}; do
		use linguas_${x} && langs+=" ${x}"
	done
	for x in ${LANGSLONG}; do
		use linguas_${x%_*} && langs+=" ${x}"
	done

	local mycmakeargs=(
		-DLINGUAS="${langs}"
		"$(cmake-utils_use debug DEBUG_OUTPUT)"
		"$(cmake-utils_use download-subs ENABLE_DOWNLOAD_SUBS)"
	)
	cmake-utils_src_configure
}
