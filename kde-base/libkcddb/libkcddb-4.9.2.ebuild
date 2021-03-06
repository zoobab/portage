# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-base/cvs-repo/gentoo-x86/kde-base/libkcddb/libkcddb-4.9.2.ebuild,v 1.1 2012/10/02 18:11:37 johu Exp $

EAPI=4

inherit kde4-base

DESCRIPTION="KDE library for CDDB"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug musicbrainz"

# tests require network access and compare static data with online data
# bug 280996
RESTRICT=test

DEPEND="
	musicbrainz? ( media-libs/musicbrainz:5 )
"
RDEPEND="${DEPEND}"
add_blocker kscd "<4.8.50"
add_blocker kdemultimedia-kioslaves

KMSAVELIBS="true"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with musicbrainz MusicBrainz5)
	)

	kde4-base_src_configure
}
