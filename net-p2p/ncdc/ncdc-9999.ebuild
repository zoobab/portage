# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-p2p/cvs-repo/gentoo-x86/net-p2p/ncdc/ncdc-9999.ebuild,v 1.6 2012/05/08 13:36:18 xmw Exp $

EAPI=4

EGIT_REPO_URI="git://g.blicky.net/ncdc.git"

inherit autotools base git-2

DESCRIPTION="ncurses directconnect client"
HOMEPAGE="http://dev.yorhel.nl/ncdc"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="app-arch/bzip2
	dev-db/sqlite:3
	dev-libs/glib:2
	dev-libs/libxml2:2
	net-libs/gnutls
	sys-libs/gdbm
	sys-libs/ncurses:5"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	dev-util/makeheaders"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		--disable-silent-rules \
		--enable-db-upgrade \
		--enable-git-version
}
