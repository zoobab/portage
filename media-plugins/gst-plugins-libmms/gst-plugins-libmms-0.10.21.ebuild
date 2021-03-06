# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-plugins/cvs-repo/gentoo-x86/media-plugins/gst-plugins-libmms/gst-plugins-libmms-0.10.21.ebuild,v 1.5 2011/07/25 18:07:13 xarthisius Exp $

inherit gst-plugins-bad

KEYWORDS="alpha amd64 ppc ppc64 sparc x86"
IUSE=""

RDEPEND=">=media-libs/gst-plugins-base-0.10.32
	>=media-libs/libmms-0.4"
DEPEND="${RDEPEND}"
