# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-db/cvs-repo/gentoo-x86/dev-db/pygresql/pygresql-4.0.ebuild,v 1.5 2012/02/26 09:13:55 patrick Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython 2.7-pypy-*"

inherit distutils

MY_P="PyGreSQL-${PV}"

DESCRIPTION="A Python interface for the PostgreSQL database."
HOMEPAGE="http://www.pygresql.org/"
SRC_URI="ftp://ftp.pygresql.org/pub/distrib/${MY_P}.tgz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~sparc ~x86"
IUSE="doc"

DEPEND="dev-db/postgresql-base"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

DOCS="docs/*.txt"
PYTHON_MODNAME="pg.py pgdb.py"

src_install() {
	distutils_src_install

	if use doc; then
		insinto /usr/share/doc/${PF}/tutorial
		doins tutorial/* || die "doins failed"
		dohtml docs/*.{html,css} || die "dohtml failed"
	fi
}
