# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-text/cvs-repo/gentoo-x86/app-text/cedilla/cedilla-0.6.ebuild,v 1.3 2011/11/28 11:51:18 phajdan.jr Exp $

EAPI="4"

inherit eutils

DESCRIPTION="UTF-8 to postscript converter."
HOMEPAGE="http://www.pps.jussieu.fr/~jch/software/cedilla/"
SRC_URI="http://www.pps.jussieu.fr/~jch/software/files/${P}.tar.gz"

KEYWORDS="amd64 x86"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

DEPEND="dev-lisp/clisp"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/cedilla-gentoo-r1.patch
}

src_compile() {
	./compile-cedilla || die "Compile failed."
}

src_install() {
	sed -i "s#${ED%/}##g" cedilla || die "sed failed"
	newman cedilla.man cedilla.1
	./install-cedilla || die "Install failed."
	dodoc NEWS README
}
