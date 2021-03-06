# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-db/cvs-repo/gentoo-x86/dev-db/gigabase/gigabase-3.83-r1.ebuild,v 1.3 2012/03/08 09:21:08 phajdan.jr Exp $

EAPI="4"
inherit eutils multilib

DESCRIPTION="OO-DBMS with interfaces for C/C++/Java/PHP/Perl"
HOMEPAGE="http://www.garret.ru/~knizhnik/gigabase.html"
SRC_URI="mirror://sourceforge/gigabase/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="doc? ( app-doc/doxygen )"
RDEPEND=""

S=${WORKDIR}/gigabase

src_prepare() {
	epatch "${FILESDIR}/${P}-fix-dereferencing.patch"
}

src_configure() {
	mf="${S}/Makefile"

	econf
	sed -r -i -e 's/subsql([^\.]|$)/subsql-gdb\1/' ${mf} || die
}

src_compile() {
	emake
	use doc && { doxygen doxygen.cfg || die; }
}

src_test() {
	pwd
	cd ${S}
	local TESTS
	local -i failcnt=0
	TESTS="testddl testidx testidx2 testiref testleak testperf testperf2 testspat testtl testsync testtimeseries"

	for t in ${TESTS}; do
		./${t} || { ewarn "$t fails"; failcnt+=1; }
	done
	[[ $failcnt != 0 ]] && die "See warnings above for tests that failed"
}

src_install() {
	einstall

	dodoc CHANGES
	use doc && dohtml GigaBASE.htm
	use doc && dohtml -r docs/html/*
}

pkg_postinst() {
	elog "The subsql binary has been renamed to subsql-gdb,"
	elog "to avoid a name clash with the FastDB version of subsql"
}
