# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-libs/cvs-repo/gentoo-x86/sys-libs/libhx/libhx-3.11.ebuild,v 1.5 2012/03/07 19:12:17 ranger Exp $

EAPI=4

DESCRIPTION="Platform independent library providing basic system functions."
HOMEPAGE="http://libhx.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/libHX-${PV}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

DEPEND="app-arch/xz-utils"
RDEPEND=""

S="${WORKDIR}/libHX-${PV}"

src_configure() {
	econf --docdir="/usr/share/doc/${PF}"
}

src_install() {
	default
	dodoc doc/*.txt
	find "${D}" -name '*.la' -delete
}
