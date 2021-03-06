# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-tcltk/cvs-repo/gentoo-x86/dev-tcltk/tclx/tclx-8.4-r2.ebuild,v 1.6 2012/07/29 18:34:32 armin76 Exp $

EAPI=4

inherit eutils multilib

DESCRIPTION="A set of extensions to TCL"
HOMEPAGE="http://tclx.sourceforge.net"
SRC_URI="mirror://sourceforge/tclx/${PN}${PV}.tar.bz2"

LICENSE="BSD"
IUSE="tk threads"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~amd64-linux ~x86-linux ~x86-macos"

DEPEND="
	>=dev-lang/tcl-8.4.6
	tk? ( >=dev-lang/tk-8.4.6 )"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}${PV}

# tests broken, bug #279283
RESTRICT="test"

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-relid.patch \
		"${FILESDIR}"/${P}-varinit.patch \
		"${FILESDIR}"/${P}-ldflags.patch
}

src_configure() {
	econf \
		$(use_enable tk) \
		$(use_enable threads) \
		--enable-shared \
		--with-tcl="${EPREFIX}/usr/$(get_libdir)/"

	# adjust install_name on darwin
	if [[ ${CHOST} == *-darwin* ]]; then
		sed -i \
			-e 's:^\(SHLIB_LD\W.*\)$:\1 -install_name ${pkglibdir}/$@:' \
				"${S}"/Makefile || die 'sed failed'
	fi
}

src_install() {
	default
	doman doc/*.[n3]
}
