# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-analyzer/cvs-repo/gentoo-x86/net-analyzer/gensink/gensink-4.1-r1.ebuild,v 1.1 2009/08/25 22:51:31 jer Exp $

EAPI="2"

inherit eutils toolchain-funcs

DESCRIPTION="Gensink ${PV}, a simple TCP benchmark suite."
HOMEPAGE="http://jes.home.cern.ch/jes/gensink/"
SRC_URI="http://jes.home.cern.ch/jes/gensink/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~ppc ~sparc ~x86"
IUSE=""

src_prepare() {
	epatch "${FILESDIR}/${P}-make.patch"
}

src_compile() {
	tc-export CC
	emake || die "emake failed"
}
src_install() {
	dobin sink4 tub4 gen4
}
