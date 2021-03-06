# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-sound/cvs-repo/gentoo-x86/media-sound/smixer/smixer-1.0.4.ebuild,v 1.7 2012/03/06 14:31:27 ranger Exp $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="command-line tool for setting and viewing mixer settings"
HOMEPAGE="http://centerclick.org/programs/smixer"
SRC_URI="http://centerclick.org/programs/${PN}/${PN}${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 hppa ppc x86"
IUSE=""

S=${WORKDIR}/${PN}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" LFLAGS="${LDFLAGS}"
}

src_install () {
	insinto /etc
	doins smixer.conf
	dobin smixer
	doman man/smixer.1
	dodoc README
}
