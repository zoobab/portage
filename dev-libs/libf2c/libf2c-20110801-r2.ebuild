# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-libs/cvs-repo/gentoo-x86/dev-libs/libf2c/libf2c-20110801-r2.ebuild,v 1.4 2012/10/06 16:53:54 armin76 Exp $

EAPI=4

inherit eutils multilib toolchain-funcs

DESCRIPTION="Library that converts FORTRAN to C source"
HOMEPAGE="http://www.netlib.org/f2c/"
SRC_URI="${HOMEPAGE}/${PN}.zip -> ${P}.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 ~ppc ~ppc64 x86 ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="static-libs"

RDEPEND=""
DEPEND="${RDEPEND}
	app-arch/unzip"

S="${WORKDIR}"

src_prepare() {
	epatch \
		"${FILESDIR}"/20051004-add-ofiles-dep.patch \
		"${FILESDIR}"/20090407-link-shared-libf2c-correctly.patch \
		"${FILESDIR}"/${P}-main.patch
	sed -i -e "s/ld /$(tc-getLD) /" makefile.u || die
}

src_compile() {
	emake \
		-f makefile.u \
		libf2c.so \
		CFLAGS="${CFLAGS} -fPIC" \
		CC="$(tc-getCC)"

	# Clean up files so we can recompile without PIC for the static lib
	if use static-libs; then
		rm *.o || die "clean failed"
		emake \
			-f makefile.u \
			all \
			CFLAGS="${CFLAGS}" \
			CC="$(tc-getCC)"
	fi
}

src_install () {
	dolib libf2c.so.2
	dosym libf2c.so.2 /usr/$(get_libdir)/libf2c.so
	use static-libs && dolib.a libf2c.a
	insinto /usr/include
	doins f2c.h
	dodoc README Notice
}
