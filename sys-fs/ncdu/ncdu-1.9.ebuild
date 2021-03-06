# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-fs/cvs-repo/gentoo-x86/sys-fs/ncdu/ncdu-1.9.ebuild,v 1.3 2012/10/14 20:11:12 maekke Exp $

EAPI=4

DESCRIPTION="NCurses Disk Usage"
HOMEPAGE="http://dev.yorhel.nl/ncdu/"
SRC_URI="http://dev.yorhel.nl/download/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~x64-macos"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"
