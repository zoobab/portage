# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-php/cvs-repo/gentoo-x86/dev-php/PEAR-DB_DataObject/PEAR-DB_DataObject-1.9.6.ebuild,v 1.7 2012/02/01 11:12:27 ssuominen Exp $

EAPI="4"

inherit php-pear-r1

KEYWORDS="alpha amd64 hppa ia64 ppc ppc64 sparc x86"

DESCRIPTION="A SQL Builder, Object Interface to Database Tables"
LICENSE="PHP-2.02 PHP-3"
SLOT="0"
IUSE="minimal"

DEPEND=""
RDEPEND=">=dev-php/PEAR-DB-1.7.6-r1
	>=dev-php/PEAR-Date-1.4.3-r1
	!minimal? ( >=dev-php/PEAR-Validate-0.5.0-r1
		    >=dev-php/PEAR-MDB2-2.0.0_rc1 )"

src_prepare() {
	# don't install windows-only stuff
	sed -re 's:<file baseinstalldir="DB" md5sum=".{32}" name="scripts/DB_DataObject_createTables.bat" role="script" />::' -i "${WORKDIR}/package.xml" || die "sed failed"
}
