# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-misc/cvs-repo/gentoo-x86/net-misc/dropbox-cli/dropbox-cli-1.ebuild,v 1.1 2012/06/09 00:40:26 hasufell Exp $

EAPI=3

PYTHON_DEPEND="2:2.6"

DESCRIPTION="Cli interface for dropbox daemon (python)"
HOMEPAGE="http://www.dropbox.com/"
SRC_URI="https://dev.gentoo.org/~hasufell/distfiles/${P}.py.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-misc/dropbox"

src_install() {
	newbin ${P}.py ${PN} || die
}
