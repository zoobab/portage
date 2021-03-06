# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-libs/cvs-repo/gentoo-x86/dev-libs/liborcus/liborcus-0.1.0.ebuild,v 1.2 2012/09/27 16:44:53 scarabeus Exp $

EAPI=4

EGIT_REPO_URI="git://gitorious.org/orcus/orcus.git"

[[ ${PV} == 9999 ]] && GITECLASS="git-2"
inherit autotools ${GITECLASS}
unset GITECLASS

DESCRIPTION="Standalone file import filter library for spreadsheet documents"
HOMEPAGE="http://gitorious.org/orcus/pages/Home"
[[ ${PV} == 9999 ]] || SRC_URI="http://kohei.us/files/orcus/src/${P/-/_}.tar.bz2"

LICENSE="MIT"
SLOT="0"
[[ ${PV} == 9999 ]] || KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

RDEPEND="
	dev-libs/libzip
"
DEPEND="${RDEPEND}
	>=dev-libs/boost-1.48.0
	>=dev-util/mdds-0.6.0
"

S="${WORKDIR}/${P/-/_}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		--disable-spreadsheet-model \
		$(use_enable static-libs static)
}

src_install() {
	default

	find "${ED}" -name '*.la' -exec rm -f {} +
}
