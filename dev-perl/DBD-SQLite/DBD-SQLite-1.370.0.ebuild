# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-perl/cvs-repo/gentoo-x86/dev-perl/DBD-SQLite/DBD-SQLite-1.370.0.ebuild,v 1.2 2012/09/01 11:27:02 grobian Exp $

EAPI=4

MODULE_AUTHOR=ADAMK
MODULE_VERSION=1.37
inherit perl-module

DESCRIPTION="Self Contained RDBMS in a DBI Driver"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x64-solaris ~x86-solaris"
IUSE="test"

RDEPEND="
	>=dev-db/sqlite-3.6.22[extensions]
	>=dev-perl/DBI-1.57
	!<dev-perl/DBD-SQLite-1
"
DEPEND="${RDEPEND}
	test? (
		>=virtual/perl-Test-Simple-0.86
	)
"

SRC_TEST="do"

src_prepare() {
	perl-module_src_prepare
	sed -i 's/^if ( 0 )/if ( 1 )/' "${S}"/Makefile.PL || die
	# remove bundled sqlite (rt.cpan#61361)
	for i in sqlite3{.c,.h,ext.h} ; do
		rm ${i} || die
		sed -i -e "/^${i}\$/d" MANIFEST || die
	done

	myconf="SQLITE_LOCATION=${EPREFIX}/usr"
}
