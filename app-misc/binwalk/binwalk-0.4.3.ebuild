# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-misc/cvs-repo/gentoo-x86/app-misc/binwalk/binwalk-0.4.3.ebuild,v 1.1 2012/03/21 09:58:51 radhermit Exp $

EAPI="4"

DESCRIPTION="A tool for identifying files embedded inside firmware images"
HOMEPAGE="http://code.google.com/p/binwalk/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-apps/file"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}/src"

DOCS=( ../docs/README )

src_configure() {
	econf \
		--enable-libmagic \
		--disable-updates
}
