# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-misc/cvs-repo/gentoo-x86/kde-misc/krcstat/krcstat-0.7.3.ebuild,v 1.2 2012/07/03 13:22:54 kensington Exp $

EAPI=4

inherit kde4-base

DESCRIPTION="A Gentoo system management tool"
HOMEPAGE="http://www.binro.org"
SRC_URI="ftp://binro.org/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	$(add_kdebase_dep konsole)
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-gcc-4.7.patch" )
