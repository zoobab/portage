# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-base/cvs-repo/gentoo-x86/kde-base/okular/okular-4.8.5-r2.ebuild,v 1.4 2012/09/03 12:20:53 scarabeus Exp $

EAPI=4

KDE_HANDBOOK="optional"
KDE_SCM="git"
inherit kde4-base

DESCRIPTION="Okular is an universal document viewer based on KPDF for KDE 4."
KEYWORDS="amd64 ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="chm crypt debug djvu ebook +jpeg +postscript +pdf +tiff"

DEPEND="
	media-libs/freetype
	media-libs/qimageblitz
	sys-libs/zlib
	chm? ( dev-libs/chmlib )
	crypt? ( app-crypt/qca:2 )
	djvu? ( app-text/djvu )
	ebook? ( app-text/ebook-tools )
	jpeg? ( virtual/jpeg:0 )
	pdf? ( >=app-text/poppler-0.12.3-r3[qt4,-exceptions(-)] )
	postscript? ( app-text/libspectre )
	tiff? ( media-libs/tiff )
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-4.9.0-memory-corruption-warning.patch"
	"${FILESDIR}/${PN}-4.9.0-close-url.patch"
)

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with chm)
		$(cmake-utils_use_with crypt QCA2)
		$(cmake-utils_use_with djvu DjVuLibre)
		$(cmake-utils_use_with ebook EPub)
		$(cmake-utils_use_with jpeg)
		$(cmake-utils_use_with postscript LibSpectre)
		$(cmake-utils_use_with pdf PopplerQt4)
		$(cmake-utils_use_with pdf Poppler)
		$(cmake-utils_use_with tiff)
	)

	kde4-base_src_configure
}
