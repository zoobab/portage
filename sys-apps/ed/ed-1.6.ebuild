# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-apps/cvs-repo/gentoo-x86/sys-apps/ed/ed-1.6.ebuild,v 1.9 2012/08/26 17:06:35 armin76 Exp $

EAPI="4"

inherit eutils toolchain-funcs

DESCRIPTION="Your basic line editor"
HOMEPAGE="http://www.gnu.org/software/ed/"
SRC_URI="mirror://gnu/ed/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~ppc-aix ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

DEPEND="sys-apps/texinfo"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.5-build.patch
}

src_configure() {
	tc-export CC
	# custom configure script ... econf wont work
	./configure \
		--prefix="${EPREFIX}"/ \
		--datadir="${EPREFIX}"/usr/share
}
