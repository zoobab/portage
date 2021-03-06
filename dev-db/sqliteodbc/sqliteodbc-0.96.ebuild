# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-db/cvs-repo/gentoo-x86/dev-db/sqliteodbc/sqliteodbc-0.96.ebuild,v 1.4 2012/09/08 16:30:11 blueness Exp $

EAPI=4

inherit eutils multilib toolchain-funcs

DESCRIPTION="ODBC driver to access local SQLite database files."
HOMEPAGE="http://www.ch-werner.de/sqliteodbc/"
SRC_URI="http://www.ch-werner.de/sqliteodbc/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm ppc x86"
IUSE=""

DEPEND=">=dev-db/sqlite-3.6
	|| (
		>=dev-db/unixODBC-2.2
		>=dev-db/libiodbc-3.5
	)"
RDEPEND="${DEPEND}"

pkg_setup() {
	tc-export CC
}

src_prepare() {
	epatch "${FILESDIR}/${PN}-0.93-respect_LDFLAGS.patch"
}

src_configure() {
	econf --disable-static
}

src_install() {
	dodir "/usr/$(get_libdir)"
	einstall
	find "${D}" -name '*.la' -exec rm -f {} + || die "la file removal failed"
	dodoc ChangeLog README
}
