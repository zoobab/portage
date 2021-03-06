# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-libs/cvs-repo/gentoo-x86/dev-libs/libroadnav/libroadnav-0.19.ebuild,v 1.2 2010/02/07 09:10:25 dirtyepic Exp $

EAPI=2
WX_GTK_VER=2.8

inherit wxwidgets

DESCRIPTION="A library capable of plotting streetmaps and providing driving directions for US addresses"
HOMEPAGE="http://roadnav.sourceforge.net"
SRC_URI="mirror://sourceforge/roadnav/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-libs/wxGTK:2.8[X]"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		--with-wx-config=${WX_CONFIG} \
		|| die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"

	# generic or empty
	for f in NEWS COPYING INSTALL; do
		rm -f "${D}"/usr/share/doc/${PN}/${f}
	done

	# --docdir is broken and hardcoded to ${PN}
	mv "${D}"/usr/share/doc/${PN} "${D}"/usr/share/doc/${P}
}
