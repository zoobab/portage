# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-sound/cvs-repo/gentoo-x86/media-sound/poc/poc-0.4.1.ebuild,v 1.4 2007/08/01 14:21:48 drac Exp $

inherit eutils toolchain-funcs

DESCRIPTION="mp3 and ogg streamer (include mp3cue and mp3cut)"
HOMEPAGE="http://www.bl0rg.net/software/poc"
SRC_URI="http://www.bl0rg.net/software/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND=""
DEPEND="sys-devel/flex
	sys-devel/bison"

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i \
		-e '/^CFLAGS/s:-O2::' \
		-e '/^PREFIX/s:/local::' \
		Makefile
	epatch "${FILESDIR}"/${P}-fec-pkt-prototype.patch
	epatch "${FILESDIR}"/${P}-file-perms.patch
}

src_compile() {
	emake CC="$(tc-getCC)" || die "emake failed."
}

src_install() {
	dodir /usr/bin /usr/share/man/man1
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc README TODO
}
