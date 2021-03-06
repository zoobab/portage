# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sci-misc/cvs-repo/gentoo-x86/sci-misc/gcam/gcam-2010.07.27.ebuild,v 1.4 2012/01/08 19:17:32 dilfridge Exp $

EAPI="1"

inherit base

DESCRIPTION="GNU Computer Aided Manufacturing"
HOMEPAGE="http://gcam.js.cx"
SRC_URI="http://gcam.js.cx/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	>=media-libs/libpng-1.5
	x11-libs/gtk+:2
	x11-libs/gtkglext
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-libpng15.patch"
)
