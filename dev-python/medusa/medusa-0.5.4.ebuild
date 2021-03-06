# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-python/cvs-repo/gentoo-x86/dev-python/medusa/medusa-0.5.4.ebuild,v 1.26 2011/11/16 19:08:33 hwoarang Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A framework for writing long-running, high-performance network servers in Python, using asynchronous sockets"
HOMEPAGE="http://www.amk.ca/python/code/medusa.html http://pypi.python.org/pypi/medusa"
SRC_URI="http://www.amk.ca/files/python/${P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 ~s390 ~sh sparc x86 ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE=""

DOCS="CHANGES.txt docs/*.txt"

src_install() {
	distutils_src_install

	dodir /usr/share/doc/${PF}/example
	cp -r demo/* "${ED}usr/share/doc/${PF}/example"
	dohtml docs/*.html docs/*.gif
}
