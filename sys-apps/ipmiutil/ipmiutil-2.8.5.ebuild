# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-apps/cvs-repo/gentoo-x86/sys-apps/ipmiutil/ipmiutil-2.8.5.ebuild,v 1.1 2012/08/19 03:54:49 flameeyes Exp $

EAPI=4
inherit autotools systemd

DESCRIPTION="IPMI Management Utilities"
HOMEPAGE="http://ipmiutil.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-libs/openssl-1:0"
DEPEND="${RDEPEND}
	virtual/os-headers"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf --disable-systemd --enable-sha256
}

src_install() {
	emake DESTDIR="${D}" sysdto="${D}/$(systemd_get_unitdir)" install
	dodoc -r AUTHORS ChangeLog NEWS README TODO doc/UserGuide

	rm -rf "${ED}"/etc/init.d # These are only for Fedora
}
