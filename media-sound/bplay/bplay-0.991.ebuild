# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-sound/cvs-repo/gentoo-x86/media-sound/bplay/bplay-0.991.ebuild,v 1.18 2009/05/08 16:28:00 ssuominen Exp $

inherit toolchain-funcs

DESCRIPTION="No-frills command-line buffered player and recorder."
HOMEPAGE="http://www.amberdata.demon.co.uk/bplay/"
SRC_URI="http://www.amberdata.demon.co.uk/bplay/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 hppa ~ppc sparc x86"
IUSE=""

src_compile() {
	emake CC="$(tc-getCC)" LDFLAGS="${LDFLAGS}" \
		CFLAGS="${CFLAGS} -DUSEBUFFLOCK" bplay || die "emake failed"
}

src_install () {
	newbin bplay bplay-bin || die "dobin failed"
	dosym bplay-bin /usr/bin/brec || die "dosym failed"
	doman brec.1
	newman bplay.1 bplay-bin.1
	dodoc README
}
