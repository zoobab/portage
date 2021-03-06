# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-plugins/cvs-repo/gentoo-x86/media-plugins/gst-plugins-mpeg2enc/gst-plugins-mpeg2enc-0.10.22-r1.ebuild,v 1.1 2011/11/04 07:30:05 ford_prefect Exp $

EAPI=2

inherit gst-plugins-bad

DESCRIPTION="GStreamer plugin for MPEG-1/2 video encoding"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=media-video/mjpegtools-1.9.0
	>=media-libs/gst-plugins-base-0.10.33"
DEPEND="${RDEPEND}"

src_prepare() {
	# Upstream patch to build against mjpegtools 2.0
	epatch "${FILESDIR}/${P}-compile-fix.patch"
}
