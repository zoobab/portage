# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sci-astronomy/cvs-repo/gentoo-x86/sci-astronomy/xfitsview/xfitsview-2.2-r1.ebuild,v 1.3 2012/08/05 20:00:56 bicatali Exp $

EAPI=4
inherit eutils

MY_PN=XFITSview
MY_P=${MY_PN}${PV}

DESCRIPTION="Viewer for astronomical images in FITS format"
HOMEPAGE="http://www.nrao.edu/software/fitsview/"
SRC_URI="ftp://ftp.cv.nrao.edu/fits/os-support/unix/xfitsview/${PN}${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND=">=x11-libs/openmotif-2.3:0"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_PN}

src_prepare() {
	find "${S}" -name "*old.c" -delete || die
	epatch "${FILESDIR}"/${P}-build_system.patch
}

src_install() {
	dobin XFITSview
	dodoc README changes notes.text
}
