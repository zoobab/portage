# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-base/cvs-repo/gentoo-x86/kde-base/kscreensaver/kscreensaver-4.9.2.ebuild,v 1.1 2012/10/02 18:12:28 johu Exp $

EAPI=4

KMNAME="kde-workspace"
OPENGL_REQUIRED="optional"
inherit kde4-meta

DESCRIPTION="KDE screensaver framework"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

RDEPEND="
	dev-libs/glib:2
	$(add_kdebase_dep kcheckpass)
	>=x11-libs/libxklavier-3.2
	>=x11-libs/libXrandr-1.2.1
	x11-libs/libXtst
	opengl? ( virtual/opengl )
"
DEPEND="${RDEPEND}
	x11-proto/randrproto
"

PATCHES=(
	"${FILESDIR}/${PN}-4.5.95-nsfw.patch"
	"${FILESDIR}/${PN}-4.6.4-xf86misc.patch"
)

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with opengl OpenGL)
	)

	kde4-meta_src_configure
}
