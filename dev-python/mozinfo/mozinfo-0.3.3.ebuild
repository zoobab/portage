# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-python/cvs-repo/gentoo-x86/dev-python/mozinfo/mozinfo-0.3.3.ebuild,v 1.2 2012/04/22 18:30:04 floppym Exp $

EAPI="4"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="File for interface to transform introspected system information to a format pallatable to Mozilla"
HOMEPAGE="https://wiki.mozilla.org/Auto-tools http://pypi.python.org/pypi/mozinfo"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="|| ( MPL-1.1 GPL-2 LGPL-2.1 )"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools
	dev-python/simplejson"
RDEPEND="${DEPEND}"

PYTHON_MODNAME="mozinfo.py"
