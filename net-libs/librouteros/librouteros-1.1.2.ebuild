# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-libs/cvs-repo/gentoo-x86/net-libs/librouteros/librouteros-1.1.2.ebuild,v 1.3 2012/05/21 10:06:46 phajdan.jr Exp $

EAPI=4

inherit base autotools-utils autotools

DESCRIPTION="Library for accessing MikroTik's RouterOS via its API"
HOMEPAGE="http://verplant.org/librouteros/"
SRC_URI="http://verplant.org/librouteros/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug static-libs"

DEPEND="dev-libs/libgcrypt"
RDEPEND="${DEPEND}"

DOCS=(README AUTHORS)
PATCHES=("${FILESDIR}"/disable_werror.patch)

src_prepare(){
	base_src_prepare
	eautoreconf
}
