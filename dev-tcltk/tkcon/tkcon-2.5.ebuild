# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-tcltk/cvs-repo/gentoo-x86/dev-tcltk/tkcon/tkcon-2.5.ebuild,v 1.2 2012/06/07 20:45:32 zmedico Exp $

inherit eutils multilib

DESCRIPTION="Tk GUI console"
HOMEPAGE="http://tkcon.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~ppc ~x86"
SLOT="0"
IUSE="doc"

DEPEND="dev-lang/tk"
RDEPEND="${DEPEND}"

src_install() {
	local tclver="$(echo 'puts $tcl_version' | tclsh)"
	local instdir=/usr/$(get_libdir)/tcl${tclver}/${PN}2.5
	dodir ${instdir}
	cp -pP pkgIndex.tcl tkcon.tcl "${D}"${instdir} || die
	dodir /usr/bin
	dosym ${instdir}/tkcon.tcl /usr/bin/tkcon
	dodoc README.txt
	if use doc; then
		dohtml doc/*
	fi
}
