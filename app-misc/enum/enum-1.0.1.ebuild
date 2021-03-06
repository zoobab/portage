# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-misc/cvs-repo/gentoo-x86/app-misc/enum/enum-1.0.1.ebuild,v 1.1 2010/10/25 22:45:59 sping Exp $

EAPI="2"

DESCRIPTION="Replacement for GNU seq and BSD jot"
HOMEPAGE="https://fedorahosted.org/enum/"
SRC_URI="https://fedorahosted.org/releases/${PN:0:1}/${PN:1:1}/${PN}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_configure() {
	econf --disable-doc-rebuild
}

src_install() {
	emake DESTDIR="${D}" install || die 'emake install'
	dodoc ChangeLog || die 'dodoc failed'
}
