# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-portage/cvs-repo/gentoo-x86/app-portage/euses/euses-2.5.9.ebuild,v 1.6 2012/09/29 16:50:01 armin76 Exp $

EAPI=4

DESCRIPTION="look up USE flag descriptions fast"
HOMEPAGE="http://www.xs4all.nl/~rooversj/gentoo"
SRC_URI="http://www.xs4all.nl/~rooversj/gentoo/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha ~amd64 arm hppa ppc ~ppc64 sparc x86 ~x86-fbsd"
IUSE=""

S=${WORKDIR}

src_install() {
	dobin ${PN}
	doman ${PN}.1
	dodoc ChangeLog
}
