# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-misc/cvs-repo/gentoo-x86/app-misc/ddccontrol-db/ddccontrol-db-20060730.ebuild,v 1.3 2010/01/29 06:03:04 jer Exp $

DESCRIPTION="DDCControl monitor database"
HOMEPAGE="http://ddccontrol.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN/-db}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc"
IUSE="nls"

DEPEND="nls? ( sys-devel/gettext )"
RDEPEND="${DEPEND}"

src_compile() {
	econf $(use_enable nls) || die "econf failed"
	# Touch db/options.xml.h, so it is not rebuilt
	touch db/options.xml.h
	emake # doesn't really build anything, but there for safety
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README
}
