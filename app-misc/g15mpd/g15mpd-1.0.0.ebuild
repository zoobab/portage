# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-misc/cvs-repo/gentoo-x86/app-misc/g15mpd/g15mpd-1.0.0.ebuild,v 1.2 2009/05/20 17:17:51 ssuominen Exp $

EAPI=2
inherit autotools eutils

DESCRIPTION="MPD (music player daemon) plugin to G15daemon"
HOMEPAGE="http://g15daemon.sourceforge.net/"
SRC_URI="mirror://sourceforge/g15daemon/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND=">=app-misc/g15daemon-1.9
	dev-libs/libg15
	dev-libs/libg15render
	>=media-libs/libmpd-0.17
	sys-libs/zlib
	x11-libs/libX11
	x11-libs/libXtst"
DEPEND="${RDEPEND}
	x11-proto/xproto
	x11-proto/xextproto"

src_prepare() {
	epatch "${FILESDIR}"/${P}-libmpd.patch
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	rm "${D}"/usr/share/doc/${P}/{COPYING,NEWS}
	prepalldocs
}
