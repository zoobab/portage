# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-misc/cvs-repo/gentoo-x86/net-misc/asterisk-rate_engine/asterisk-rate_engine-0.5.4.ebuild,v 1.7 2011/05/01 00:43:38 halcy0n Exp $

inherit eutils

MY_PN="rate-engine"

DESCRIPTION="Asterisk application for least-cost routing"
HOMEPAGE="http://www.trollphone.org/files/"
SRC_URI="http://www.trollphone.org/files/${MY_PN}-${PV}.tar.gz"

IUSE=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND="dev-libs/libpcre
	virtual/mysql
	>=net-misc/asterisk-1.0.5-r1
	!>=net-misc/asterisk-1.1.0"

S=${WORKDIR}/${MY_PN}-${PV}

src_unpack() {
	unpack ${A}

	cd "${S}"
	# cflag fixes, install fixes and changes for asterisk-config
	epatch "${FILESDIR}"/${MY_PN}-${PV}-astcfg.diff
}

src_compile() {
	emake -j1 || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install samples || die
	dodoc ChangeLog DISCLAIMER NEWS README TODO *.sql *.conf*
}
