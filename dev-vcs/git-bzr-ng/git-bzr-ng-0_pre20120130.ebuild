# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-vcs/cvs-repo/gentoo-x86/dev-vcs/git-bzr-ng/git-bzr-ng-0_pre20120130.ebuild,v 1.3 2012/08/11 09:30:20 ago Exp $

EAPI="4"

PYTHON_DEPEND="2"

inherit python

DESCRIPTION="Git subcommand providing a bidirectional bridge to Bazaar repositories"
HOMEPAGE="https://github.com/termie/git-bzr-ng"
SRC_URI="http://dev.gentoo.org/~tetromino/distfiles/${PN}/${P}.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=dev-vcs/bzr-2.2
	dev-vcs/git
	>=dev-vcs/bzr-fastimport-0.10
	dev-python/python-fastimport"
DEPEND="app-arch/xz-utils"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	python_convert_shebangs 2 git-bzr
}

src_install() {
	exeinto /usr/libexec/git-core
	doexe git-bzr
	dodoc README.rst
}
