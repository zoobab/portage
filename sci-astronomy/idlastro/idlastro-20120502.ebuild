# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sci-astronomy/cvs-repo/gentoo-x86/sci-astronomy/idlastro/idlastro-20120502.ebuild,v 1.2 2012/07/03 22:19:06 bicatali Exp $

EAPI=4

DESCRIPTION="Astronomical user routines for IDL"
HOMEPAGE="http://idlastro.gsfc.nasa.gov/"
SRC_URI="${HOMEPAGE}/ftp/astron.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""
DEPEND=""
RDEPEND=">=dev-lang/gdl-0.9.2-r1"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/gnudatalanguage/${PN}
	doins -r pro/*
	dodoc *txt text/*
}
