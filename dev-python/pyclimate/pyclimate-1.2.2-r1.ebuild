# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-python/cvs-repo/gentoo-x86/dev-python/pyclimate/pyclimate-1.2.2-r1.ebuild,v 1.10 2012/02/23 08:02:18 patrick Exp $

EAPI="3"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* 2.7-pypy-* *-jython"

inherit eutils distutils

MY_P="${P/pyclimate/PyClimate}"

DESCRIPTION="Climate Data Analysis Module for Python"
HOMEPAGE="http://www.pyclimate.org/"
SRC_URI="http://fisica.ehu.es/jsaenz/pyclimate_files/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE="examples"

DEPEND=""
RDEPEND="
	dev-python/numpy
	>=dev-python/scientificpython-2.8
	>=sci-libs/netcdf-3.0"

S="${WORKDIR}/${MY_P}"

src_install() {
	distutils_src_install

	dodoc doc/manual.ps doc/dcdflib_doc/dcdflib* || die

	if use examples; then
		insinto /usr/share/${PF}
		doins -r examples test || die
	fi
}
