# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-mail/cvs-repo/gentoo-x86/net-mail/randomsig/randomsig-1.10.0.ebuild,v 1.12 2007/07/14 22:22:19 mr_bones_ Exp $

MY_P=${PN}-v${PV}
S=${WORKDIR}/${MY_P}
DESCRIPTION="randomsig - perl script for generating random .signature files"
HOMEPAGE="http://suso.suso.org/programs/randomsig/"
DEPEND="dev-lang/perl"
SRC_URI="http://suso.suso.org/programs/randomsig/downloads/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 s390 sparc x86"
IUSE=""

src_unpack() {
	unpack ${A}
	cd ${S}
	cp Makefile Makefile.orig
	cp randomsig randomsig.orig
	sed -e "s:/usr/local/bin:/usr/bin:" \
		-e "s:/usr/local/etc:/etc:" \
		Makefile.orig > Makefile

	sed -e "s:/usr/local/etc:/etc:" \
		randomsig.orig > randomsig
}

src_install () {
	dobin randomsig
	dodoc README BUGS LICENSE MANIFEST COPYING TODO

	insinto /etc/randomsig
	doins .randomsigrc .sigquotes .sigcancel .sigread
}
