# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-devel/cvs-repo/gentoo-x86/sys-devel/gcc/gcc-4.2.4-r1.ebuild,v 1.11 2011/12/02 23:43:54 vapier Exp $

PATCH_VER="1.1"
UCLIBC_VER="1.0"

inherit toolchain

DESCRIPTION="The GNU Compiler Collection"

LICENSE="GPL-3 LGPL-2.1 || ( GPL-3 libgcc libstdc++ ) FDL-1.2"
KEYWORDS="~alpha ~amd64 ~arm hppa ~ia64 ~m68k ~ppc ~ppc64 ~sparc ~x86 ~sparc-fbsd ~x86-fbsd"

RDEPEND=""
DEPEND="${RDEPEND}
	ppc? ( >=${CATEGORY}/binutils-2.17 )
	ppc64? ( >=${CATEGORY}/binutils-2.17 )
	>=${CATEGORY}/binutils-2.15.94"

src_unpack() {
	toolchain_src_unpack

	use vanilla && return 0

	[[ ${CHOST} == ${CTARGET} ]] && epatch "${FILESDIR}"/gcc-spec-env.patch

	[[ ${CTARGET} == *-softfloat-* ]] && epatch "${FILESDIR}"/4.0.2/gcc-4.0.2-softfloat.patch
}
