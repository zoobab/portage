# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-plugins/cvs-repo/gentoo-x86/media-plugins/vdr-proxy/vdr-proxy-0.1.4-r1.ebuild,v 1.1 2012/06/12 19:26:34 hd_brummy Exp $

EAPI="4"

inherit vdr-plugin-2

IUSE=""
SLOT="0"

DESCRIPTION="VDR Plugin Proxy - enable grouping of menu entries, online load/unload"
HOMEPAGE="http://urichter.cjb.net/vdr/?h=proxy"
SRC_URI="http://www.mathematik.uni-kassel.de/~urichter/vdr/files/${P}.tgz"
LICENSE="GPL-2"

KEYWORDS="~x86"

DEPEND=">=media-video/vdr-1.3.23"
