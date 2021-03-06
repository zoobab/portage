# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-cpp/cvs-repo/gentoo-x86/dev-cpp/libcmis/libcmis-0.1.0-r1.ebuild,v 1.2 2012/09/15 07:15:48 scarabeus Exp $

EAPI=4

EGIT_REPO_URI="git://gitorious.org/libcmis/libcmis.git"
[[ ${PV} == 9999 ]] && SCM_ECLASS="git-2"
inherit autotools alternatives ${SCM_ECLASS}
unset SCM_ECLASS

DESCRIPTION="C++ client library for the CMIS interface"
HOMEPAGE="https://sourceforge.net/projects/libcmis/"
[[ ${PV} == 9999 ]] || SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="|| ( GPL-2 LGPL-2 MPL-1.1 )"
SLOT="0.2"
[[ ${PV} == 9999 ]] || KEYWORDS="amd64 ppc x86 ~amd64-linux ~x86-linux"
IUSE="static-libs test"

RDEPEND="
	!dev-cpp/libcmis:0
	dev-libs/boost
	dev-libs/libxml2
	<net-misc/curl-7.27.0
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	test? ( dev-util/cppunit )
"

# It fetches the apache chemistry webapp and then try to run some magic on it
RESTRICT="test"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		--docdir="${EPREFIX}"/usr/share/doc/${PF} \
		--program-suffix=-${SLOT} \
		--disable-werror \
		$(use_enable static-libs static) \
		$(use_enable test tests) \
		--enable-client
}

src_install() {
	default
	find "${ED}" -name '*.la' -exec rm -f {} +
}

pkg_postinst() {
	alternatives_auto_makesym /usr/bin/cmis-client "/usr/bin/cmis-client-[0-9].[0-9]"
}

pkg_postrm() {
	alternatives_auto_makesym /usr/bin/cmis-client "/usr/bin/cmis-client-[0-9].[0-9]"
}
