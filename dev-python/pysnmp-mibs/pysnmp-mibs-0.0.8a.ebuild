# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-python/cvs-repo/gentoo-x86/dev-python/pysnmp-mibs/pysnmp-mibs-0.0.8a.ebuild,v 1.2 2010/12/23 16:03:31 arfrever Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython"

inherit distutils

DESCRIPTION="SNMP framework in Python - MIBs"
HOMEPAGE="http://pysnmp.sf.net/ http://pypi.python.org/pypi/pysnmp-mibs"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-python/pysnmp-4.1.10a"
RDEPEND="${DEPEND}
	dev-python/setuptools"

DOCS="CHANGES README"
PYTHON_MODNAME="pysnmp_mibs"
