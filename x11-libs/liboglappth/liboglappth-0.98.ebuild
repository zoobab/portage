# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-libs/cvs-repo/gentoo-x86/x11-libs/liboglappth/liboglappth-0.98.ebuild,v 1.9 2012/05/05 03:52:30 jdhore Exp $

inherit eutils

DESCRIPTION="A library for creating portable OpenGL applications with easy-to-code scene setup and selection."
HOMEPAGE="http://www.bioinformatics.org/ghemical/"
SRC_URI="http://www.bioinformatics.org/ghemical/download/current/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""
RDEPEND="virtual/opengl
	media-libs/freeglut"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/gcc-4.3.patch
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
