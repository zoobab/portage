# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-i18n/cvs-repo/gentoo-x86/app-i18n/mecab-skkserv/mecab-skkserv-0.03.ebuild,v 1.4 2012/08/28 07:32:45 naota Exp $

EAPI=4

inherit multilib autotools-utils

DESCRIPTION="mecab-skkserv is a Kana-Kanji conversion server using MeCab."
HOMEPAGE="http://chasen.org/~taku/software/mecab-skkserv/"
SRC_URI="http://chasen.org/~taku/software/mecab-skkserv/${P}.tar.gz"

LICENSE="GPL-2 ipadic"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

DEPEND=">=app-text/mecab-0.91"
RDEPEND="${DEPEND}
	sys-apps/xinetd"

DOCS=( README NEWS AUTHORS )
HTML_DOCS=( index.html )
PATCHES=( "${FILESDIR}"/${P}-cflags.patch )
AUTOTOOLS_AUTORECONF=1
AUTOTOOLS_IN_SOURCE_BUILD=1

src_prepare() {
	sed -i -e "/^dictdir/s@lib@$(get_libdir)@" Makefile.am || die
	autotools-utils_src_prepare
}

src_install() {
	autotools-utils_src_install

	# for running skkserv from xinetd
	insinto /etc/xinetd.d; doins "${FILESDIR}"/mecab-skkserv || die
}
