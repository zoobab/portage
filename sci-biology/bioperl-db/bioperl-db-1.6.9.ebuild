# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sci-biology/cvs-repo/gentoo-x86/sci-biology/bioperl-db/bioperl-db-1.6.9.ebuild,v 1.2 2012/06/23 10:22:57 jlec Exp $

EAPI="2"

BIOPERL_RELEASE=1.6.9

MY_PN=BioPerl-DB
MODULE_AUTHOR=CJFIELDS
MODULE_VERSION=1.006900
inherit perl-module

DESCRIPTION="Perl tools for bioinformatics - Perl API that accesses the BioSQL schema"
HOMEPAGE="http://www.bioperl.org/"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
SRC_TEST="do"

CDEPEND="
	>=sci-biology/bioperl-${PV}
	dev-perl/DBD-mysql
	dev-perl/DBI
	sci-biology/biosql"
DEPEND="${CDEPEND}
	virtual/perl-Module-Build"
RDEPEND="${CDEPEND}"

src_install() {
	mydoc="AUTHORS BUGS FAQ"
	perl-module_src_install
}
