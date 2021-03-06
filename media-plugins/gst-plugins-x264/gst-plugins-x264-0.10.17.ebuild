# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-plugins/cvs-repo/gentoo-x86/media-plugins/gst-plugins-x264/gst-plugins-x264-0.10.17.ebuild,v 1.3 2011/05/23 14:56:28 hwoarang Exp $

inherit eutils gst-plugins-ugly

KEYWORDS="amd64 ~ppc ~ppc64 x86"
IUSE=""

# 20100224 ensures us X264_BUILD >= 86, which added presets support
RDEPEND=">=media-libs/x264-0.0.20100224
	>=media-libs/gstreamer-0.10.26
	>=media-libs/gst-plugins-base-0.10.26"
DEPEND="${RDEPEND}"
