# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-apps/cvs-repo/gentoo-x86/sys-apps/dtc/dtc-1.3.0.ebuild,v 1.1 2011/06/15 21:19:11 flameeyes Exp $

EAPI=4
inherit toolchain-funcs

MY_P="${PN}-v${PV}"

DESCRIPTION="Open Firmware device-trees compiler"
HOMEPAGE="http://www.t2-project.org/packages/dtc.html"
SRC_URI="http://www.jdl.com/software/${MY_P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="sys-devel/flex
	sys-devel/bison"

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -i -e "s:CFLAGS =:CFLAGS +=:" \
		   -e "s:CPPFLAGS =:CPPFLAGS +=:" \
		   -e "s:-Werror::" \
		   -e "s:-g -Os::" \
		Makefile || die
}

src_compile() {
	tc-export AR CC
	emake PREFIX="/usr" LIBDIR="/usr/$(get_libdir)"
}

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" LIBDIR="/usr/$(get_libdir)" \
		 install
	dodoc Documentation/manual.txt
}
