# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-libs/cvs-repo/gentoo-x86/dev-libs/libvolume_id/libvolume_id-0.81.1.ebuild,v 1.1 2009/07/01 14:47:54 aballier Exp $

DESCRIPTION="Library to provide file system information"
HOMEPAGE="http://www.marcuscom.com"
SRC_URI="http://www.marcuscom.com/downloads/${PF}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86-fbsd"
IUSE="static"

DEPEND=""
RDEPEND=""

src_compile() {
	make E="@echo" RANLIB=ranlib AR=ar Q=@
}

src_install() {
	dodir /usr/share/pkgconfig
	insinto /usr/share/pkgconfig
	doins libvolume_id.pc

	insinto /usr/include
	doins libvolume_id.h

	insinto /usr
	dolib libvolume_id.so.0
	dosym libvolume_id.so.0 /usr/lib/libvolume_id.so
	use static && dolib libvolume_id.a
}
