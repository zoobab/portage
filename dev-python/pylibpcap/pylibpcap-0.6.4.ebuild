# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-python/cvs-repo/gentoo-x86/dev-python/pylibpcap/pylibpcap-0.6.4.ebuild,v 1.4 2012/09/12 12:25:40 johu Exp $

EAPI="4"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython"

inherit distutils

DESCRIPTION="Python interface to libpcap"
HOMEPAGE="http://sourceforge.net/projects/pylibpcap/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~hppa ~ia64 x86"
IUSE="examples"

RDEPEND="net-libs/libpcap"
DEPEND="${RDEPEND}"

PYTHON_MODNAME="pcap.py"

src_install() {
	distutils_src_install

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}
