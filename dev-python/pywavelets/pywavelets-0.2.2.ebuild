# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-python/cvs-repo/gentoo-x86/dev-python/pywavelets/pywavelets-0.2.2.ebuild,v 1.2 2012/10/12 00:56:34 floppym Exp $

EAPI=4
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython 2.7-pypy-*"

inherit distutils

MY_PN="${PN/pyw/PyW}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python module for discrete, stationary, and packet wavelet transforms."
HOMEPAGE="http://www.pybytes.com/pywavelets/ http://pypi.python.org/pypi/PyWavelets"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc examples test"

DEPEND="app-arch/unzip
	dev-python/cython
	test? ( dev-python/numpy )"
RDEPEND="dev-python/numpy"

S="${WORKDIR}/${MY_P}"

DOCS="CHANGES.txt THANKS.txt"
PYTHON_MODNAME="pywt"

src_test() {
	testing() {
		PYTHONPATH="$(ls -d build-${PYTHON_ABI}/lib.*)" \
			"$(PYTHON)" tests/test_perfect_reconstruction.py
	}
	python_execute_function testing
}

src_install () {
	distutils_src_install
	use doc && dohtml -r doc/build/html/*
	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins demo/* || die "doins failed"
	fi
}
