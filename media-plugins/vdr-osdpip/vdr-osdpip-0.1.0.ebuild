# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-plugins/cvs-repo/gentoo-x86/media-plugins/vdr-osdpip/vdr-osdpip-0.1.0.ebuild,v 1.2 2012/02/21 22:58:26 hd_brummy Exp $

EAPI=3

inherit vdr-plugin flag-o-matic

DESCRIPTION="VDR plugin: Show another channel in the OSD"
HOMEPAGE="http://projects.vdr-developer.org/projects/plg-osdpip"
SRC_URI="mirror://vdr-developerorg/download/267/${P}.tgz"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

DEPEND=">=media-video/vdr-1.6.0_p2-r5
	>=media-libs/libmpeg2-0.5.1
	>=virtual/ffmpeg-0.6.90"
RDEPEND="${DEPEND}"

src_prepare() {
	vdr-plugin_src_prepare

	# UINT64_C is needed by ffmpeg headers
	append-flags -D__STDC_CONSTANT_MACROS
}
