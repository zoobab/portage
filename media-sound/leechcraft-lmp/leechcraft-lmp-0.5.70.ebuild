# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-sound/cvs-repo/gentoo-x86/media-sound/leechcraft-lmp/leechcraft-lmp-0.5.70.ebuild,v 1.5 2012/07/15 15:36:02 kensington Exp $

EAPI="4"

inherit leechcraft

DESCRIPTION="LeechCraft Media Player, Phonon-based audio/video player."

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug kde"

DEPEND="~net-misc/leechcraft-core-${PV}
		kde? ( media-libs/phonon )
		!kde? ( x11-libs/qt-phonon:4 )
		media-libs/taglib
		x11-libs/qt-declarative:4"
RDEPEND="${DEPEND}"
