# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-libs/cvs-repo/gentoo-x86/sys-libs/newlib/newlib-1.20.0.ebuild,v 1.3 2012/04/27 01:09:29 vapier Exp $

EAPI="4"

inherit eutils flag-o-matic toolchain-funcs

export CBUILD=${CBUILD:-${CHOST}}
export CTARGET=${CTARGET:-${CHOST}}
if [[ ${CTARGET} == ${CHOST} ]] ; then
	if [[ ${CATEGORY/cross-} != ${CATEGORY} ]] ; then
		export CTARGET=${CATEGORY/cross-}
	fi
fi

DESCRIPTION="Newlib is a C library intended for use on embedded systems"
HOMEPAGE="http://sourceware.org/newlib/"
SRC_URI="ftp://sources.redhat.com/pub/newlib/${P}.tar.gz"

LICENSE="NEWLIB LIBGLOSS GPL-2"
[[ ${CTARGET} != ${CHOST} ]] \
	&& SLOT="${CTARGET}" \
	|| SLOT="0"
KEYWORDS="-* ~arm ~hppa ~m68k ~mips ~ppc ~ppc64 ~sh ~sparc ~x86"
IUSE="nls threads unicode crosscompile_opts_headers-only"
RESTRICT="strip"

NEWLIBBUILD="${WORKDIR}/build"

pkg_setup() {
	# Reject newlib-on-glibc type installs
	if [[ ${CTARGET} == ${CHOST} ]] ; then
		case ${CHOST} in
			*-newlib|*-elf) ;;
			*) die "Use sys-devel/crossdev to build a newlib toolchain" ;;
		esac
	fi
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-cris-install.patch
	epatch "${FILESDIR}"/${P}-arm-targets.patch #413547
}

src_configure() {
	# we should fix this ...
	unset LDFLAGS
	CHOST=${CTARGET} strip-unsupported-flags

	local myconf=""
	# hardwired to avoid breakages
	[[ $(tc-is-softfloat) != "no" ]] \
		&& myconf="--disable-newlib-hw-fp" \
		|| myconf="--enable-newlib-hw-fp"
	[[ ${CTARGET} == "spu" ]] \
		&& myconf="${myconf} --disable-newlib-multithread" \
		|| myconf="${myconf} $(use_enable threads newlib-multithread)"

	mkdir -p "${NEWLIBBUILD}"
	cd "${NEWLIBBUILD}"

	ECONF_SOURCE=${S} \
	econf \
		$(use_enable unicode newlib-mb) \
		$(use_enable nls) \
		${myconf}
}

src_compile() {
	emake -C "${NEWLIBBUILD}"
}

src_install() {
	cd "${NEWLIBBUILD}"
	emake -j1 DESTDIR="${D}" install
#	env -uRESTRICT CHOST=${CTARGET} prepallstrip
	# minor hack to keep things clean
	rm -fR "${D}"/usr/share/info
	rm -fR "${D}"/usr/info
}
