# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-embedded/cvs-repo/gentoo-x86/dev-embedded/ponyprog/ponyprog-2.07a-r2.ebuild,v 1.1 2010/06/20 13:35:25 ssuominen Exp $

EAPI="3"

inherit eutils toolchain-funcs

DESCRIPTION="Serial device programmer"
HOMEPAGE="http://www.lancos.com/ppwin95.html"
SRC_URI="mirror://sourceforge/${PN}/PonyProg2000-${PV}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/libXaw
	x11-libs/libXmu
	x11-libs/libXt
	x11-libs/libXext
	x11-libs/libX11
	x11-misc/xdg-utils"
DEPEND="${RDEPEND}
	|| ( media-gfx/graphicsmagick[imagemagick] media-gfx/imagemagick )"

S="${WORKDIR}/PonyProg2000-${PV}"

src_prepare() {
	sed -i \
		-e "s:\$(HOME)/Progetti/PonyProg_Sourceforge/v:${S}/v:" \
		-e 's/\-O2//' \
		v/Config.mk || die "sed failed"

	sed -i -e 's/<asm\/io.h>/<sys\/io.h>/' *.cpp || die

	sed -i -e 's/netscape/xdg-open/' e2cmdw.cpp || die

	convert ponyprog.ico ponyprog.png

	epatch "${FILESDIR}"/${P}-gcc43.patch \
		"${FILESDIR}"/${P}-build.patch
}

src_compile() {
	tc-export CC CXX

	# bug #282244
	emake -j1 || die "emake failed"
}

src_install() {
	dobin bin/ponyprog2000 || die
	keepdir /var/lock/uucp
	fowners uucp:uucp /var/lock/uucp
	fperms 755 /var/lock/uucp
	doicon ponyprog.png
	make_desktop_entry ponyprog2000 PonyProg2000 ponyprog
}

pkg_postinst() {
	elog "To use the COM port in user mode (not as root), you need to"
	elog "be in the 'uucp' group."
	elog
	elog "To use the LPT port in user mode (not as root) you need a kernel with"
	elog "ppdev, parport and parport_pc compiled in or as modules. You need the"
	elog "rights to write to /dev/parport? devices."
}
