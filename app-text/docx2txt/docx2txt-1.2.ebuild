# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-text/cvs-repo/gentoo-x86/app-text/docx2txt/docx2txt-1.2.ebuild,v 1.1 2012/01/15 02:53:43 radhermit Exp $

EAPI=4

inherit eutils

DESCRIPTION="Convert MS Office docx files to plain text"
HOMEPAGE="http://docx2txt.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-arch/unzip
	dev-lang/perl"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.1-paragraph-newline.patch
}

src_compile() { :; }

src_install() {
	newbin docx2txt.pl docx2txt
	dodoc docx2txt.config README ChangeLog ToDo AUTHORS
}
