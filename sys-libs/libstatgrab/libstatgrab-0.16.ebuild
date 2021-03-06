# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-libs/cvs-repo/gentoo-x86/sys-libs/libstatgrab/libstatgrab-0.16.ebuild,v 1.4 2012/02/16 19:22:43 phajdan.jr Exp $

DESCRIPTION="a tool to provide access to statistics about the system on which it's run."
HOMEPAGE="http://www.i-scream.org/libstatgrab/"
SRC_URI="http://www.mirrorservice.org/sites/ftp.i-scream.org/pub/i-scream/libstatgrab/${P}.tar.gz"

LICENSE="|| ( GPL-2 LGPL-2.1 )"
SLOT=0
KEYWORDS="~amd64 ~ia64 ppc x86"
IUSE=""

src_compile() {
	econf --disable-setgid-binaries --disable-setuid-binaries \
		--disable-deprecated --with-ncurses
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc ChangeLog PLATFORMS NEWS AUTHORS README
}
