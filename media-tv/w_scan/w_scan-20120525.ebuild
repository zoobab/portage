# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-tv/cvs-repo/gentoo-x86/media-tv/w_scan/w_scan-20120525.ebuild,v 1.3 2012/09/23 08:03:53 phajdan.jr Exp $

EAPI="4"

DESCRIPTION="Scan for DVB-C/DVB-T/DVB-S channels without prior knowledge of frequencies and modulations"
HOMEPAGE="http://wirbel.htpc-forum.de/w_scan/index2.html"
SRC_URI="http://wirbel.htpc-forum.de/w_scan/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc examples"

DEPEND=">=virtual/linuxtv-dvb-headers-5.3"
RDEPEND=""

src_install() {
	emake DESTDIR="${D}" install

	dodoc ChangeLog README

	if use doc; then
		dodoc doc/README.file_formats doc/README_VLC_DVB
	fi

	if use examples; then
		docinto examples
		dodoc doc/rotor.conf
	fi
}
