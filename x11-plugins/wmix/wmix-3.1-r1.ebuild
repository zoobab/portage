# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-plugins/cvs-repo/gentoo-x86/x11-plugins/wmix/wmix-3.1-r1.ebuild,v 1.8 2009/06/04 00:19:01 tcunha Exp $

inherit eutils toolchain-funcs

DESCRIPTION="Dockapp mixer for OSS or ALSA"
HOMEPAGE="http://www.ne.jp/asahi/linux/timecop/"
SRC_URI="http://www.ne.jp/asahi/linux/timecop/software/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc sparc x86"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXpm"
DEPEND="${RDEPEND}
	x11-proto/xproto
	x11-proto/xextproto"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/fix-wmix-3.1-version-number.patch
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}" || die "emake failed."
}

src_install() {
	dobin ${PN}
	doman "${FILESDIR}"/${PN}.1
	dodoc AUTHORS BUGS NEWS README sample.wmixrc
}
