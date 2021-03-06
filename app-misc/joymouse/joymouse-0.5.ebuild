# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-misc/cvs-repo/gentoo-x86/app-misc/joymouse/joymouse-0.5.ebuild,v 1.4 2008/01/15 10:01:53 nyhm Exp $

DESCRIPTION="An application that translates joystick events to mouse events"
HOMEPAGE="http://sourceforge.net/projects/joymouse-linux"
SRC_URI="mirror://sourceforge/joymouse-linux/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~mips ~ppc x86"
IUSE=""

DEPEND="x11-proto/xextproto
	x11-proto/inputproto"
RDEPEND="x11-libs/libX11
	x11-libs/libXtst"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS README
}
