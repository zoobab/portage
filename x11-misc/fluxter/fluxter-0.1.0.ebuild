# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-misc/cvs-repo/gentoo-x86/x11-misc/fluxter/fluxter-0.1.0.ebuild,v 1.17 2010/06/13 15:06:18 ssuominen Exp $

EAPI=2
inherit autotools eutils

DESCRIPTION="workspace pager dockapp, particularly useful with the Fluxbox window manager"
HOMEPAGE="http://www.isomedia.com/homes/stevencooper"
SRC_URI="http://www.isomedia.com/homes/stevencooper/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 hppa ppc x86 ~x86-fbsd"
IUSE=""

DEPEND="x11-libs/libX11
	x11-libs/libSM
	x11-libs/libICE"

src_prepare() {
	epatch "${FILESDIR}"/${P}-asneeded.patch
	eautoreconf
}

src_configure() {
	econf \
		--datadir=/usr/share/commonbox
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS BUGS ChangeLog README TODO
}
