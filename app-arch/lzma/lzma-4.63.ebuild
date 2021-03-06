# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-arch/cvs-repo/gentoo-x86/app-arch/lzma/lzma-4.63.ebuild,v 1.2 2009/01/26 23:18:01 mr_bones_ Exp $

inherit toolchain-funcs

DESCRIPTION="LZMA Stream Compressor from the SDK"
HOMEPAGE="http://www.7-zip.org/sdk.html"
SRC_URI="mirror://sourceforge/sevenzip/${PN}463.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~arm ~amd64 ~ia64 ~mips ~sparc ~x86"
IUSE="doc"

S=${WORKDIR}

src_compile() {
	cd CPP/7zip/Compress/LZMA_Alone
	emake -f makefile.gcc \
		CXX="$(tc-getCXX) ${CXXFLAGS}" \
		CXX_C="$(tc-getCC) ${CFLAGS}" \
		|| die "Make failed"
}

src_install() {
	newbin CPP/7zip/Compress/LZMA_Alone/lzma lzma_alone|| die
	dodoc history.txt
	use doc && dodoc 7zC.txt 7zFormat.txt lzma.txt Methods.txt

	einfo "Starting from app-arch/lzma version 4.63 binary name was changed"
	einfo "to /usr/bin/lzma_alone to avoid conflict with lzma-utils package"
}
