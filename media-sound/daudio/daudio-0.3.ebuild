# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-sound/cvs-repo/gentoo-x86/media-sound/daudio/daudio-0.3.ebuild,v 1.10 2009/08/03 13:22:40 ssuominen Exp $

inherit eutils toolchain-funcs

DESCRIPTION="Distributed audio on the local network"
HOMEPAGE="http://daudio.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
#-sparc: 0.3: static audio on local daemon.  No audio when client connects to amd64 daemon
KEYWORDS="amd64 ~ppc -sparc x86"

IUSE=""
DEPEND=">=media-libs/libmad-0.15.0b-r1"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}/${P}-makefile.patch"
}

src_compile() {
	tc-export CC
	emake -C client || die "emake failed"
	emake -C server || die "emake failed"
	emake -C streamer || die "emake failed"
}

src_install() {
	dobin client/daudioc server/daudiod streamer/dstreamer
	newinitd "${FILESDIR}"/daudio.rc daudio
	dodoc doc/*
}
