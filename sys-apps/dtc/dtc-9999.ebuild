# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-apps/cvs-repo/gentoo-x86/sys-apps/dtc/dtc-9999.ebuild,v 1.1 2011/10/17 21:39:35 vapier Exp $

EAPI="4"
MY_P="${PN}-v${PV}"

inherit multilib toolchain-funcs
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://git.jdl.com/software/dtc.git"
	inherit git-2
else
	SRC_URI="http://www.jdl.com/software/${MY_P}.tgz"
	KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
fi

DESCRIPTION="Open Firmware device-trees compiler"
HOMEPAGE="http://git.jdl.com/gitweb/?p=dtc.git"

LICENSE="GPL-2"
SLOT="0"
IUSE="static-libs"

RDEPEND=""
DEPEND="sys-devel/flex
	sys-devel/bison"

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -i \
		-e '/^CFLAGS =/s:=:+=:' \
		-e '/^CPPFLAGS =/s:=:+=:' \
		-e 's:-Werror::' \
		-e 's:-g -Os::' \
		-e '/^PREFIX =/s:=.*:= /usr:' \
		-e "/^LIBDIR =/s:=.*:= /usr/$(get_libdir):" \
		Makefile || die
	tc-export AR CC
	export V=1
}

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" install
	use static-libs || find "${D}" -name '*.a' -delete
	dodoc Documentation/manual.txt
}
