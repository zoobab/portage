# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-editors/cvs-repo/gentoo-x86/app-editors/vile/vile-9.8g.ebuild,v 1.5 2012/07/08 18:16:13 armin76 Exp $

EAPI="4"

DESCRIPTION="VI Like Emacs -- yet another full-featured vi clone"
HOMEPAGE="http://invisible-island.net/vile/"
SRC_URI="ftp://invisible-island.net/vile/current/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc sparc x86 ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE="perl"

RDEPEND=">=sys-libs/ncurses-5.2
	perl? ( dev-lang/perl )"
DEPEND="${RDEPEND}
	sys-devel/flex
	app-admin/eselect-vi"

src_configure() {
	econf \
		--with-ncurses \
		$(use_with perl )
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc CHANGES* README doc/*.doc
	dohtml doc/*.html
}

pkg_postinst() {
	einfo "Updating ${EPREFIX}/usr/bin/vi symlink"
	eselect vi update --if-unset
}

pkg_postrm() {
	einfo "Updating ${EPREFIX}/usr/bin/vi symlink"
	eselect vi update --if-unset
}
