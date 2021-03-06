# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-plugins/cvs-repo/gentoo-x86/media-plugins/vdr-pilot/vdr-pilot-0.0.9.ebuild,v 1.3 2008/04/28 08:36:02 zzam Exp $

IUSE=""
inherit vdr-plugin eutils

DESCRIPTION="VDR plugin: Another way for viewing EPG and zap to channels"
HOMEPAGE="http://famillejacques.free.fr/vdr/"
SRC_URI="http://famillejacques.free.fr/vdr/pilot/${P}.tgz"

KEYWORDS="x86"
SLOT="0"
LICENSE="GPL-2"

DEPEND=">=media-video/vdr-1.4.1"

PATCHES=("${FILESDIR}/${P}-german.diff")
