# Copyright 2003-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-tv/cvs-repo/gentoo-x86/media-tv/shoutcast2vdr/shoutcast2vdr-0.0.8.ebuild,v 1.1 2008/01/13 14:28:46 hd_brummy Exp $

DESCRIPTION="VDR script: generate shoutcast playlists"
HOMEPAGE="http://www.vdr-portal.de/board/thread.php?threadid=19478"
SRC_URI="http://www.kost.sh/vdr/${P}.gz"

KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

DEPEND="media-video/vdr"

S="${WORKDIR}"

PLAYLIST_DIR="/var/cache/vdr/music/playlists"

src_unpack() {

	unpack ${A}
	cd "${S}"

	sed -i shoutcast2vdr-0.0.8 -e "s:outputdir=/home/volker/vdr/radio:outputdir=${PLAYLIST_DIR}:"
}

src_install() {

	exeinto /usr/share/vdr/shoutcast2vdr
	newexe shoutcast2vdr-0.0.8 shoutcast2vdr

	keepdir ${PLAYLIST_DIR}
}
