# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-python/cvs-repo/gentoo-x86/dev-python/pyfire/pyfire-0.3.4.ebuild,v 1.1 2012/09/21 08:20:23 pinkbyte Exp $

EAPI=4

DISTUTILS_SRC_TEST="setup.py"

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.7"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A python implementation of the Campfire API"
HOMEPAGE="http://www.pyfire.org/"

SRC_URI="mirror://pypi/p/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="
	dev-python/pyopenssl
	dev-python/twisted
"
