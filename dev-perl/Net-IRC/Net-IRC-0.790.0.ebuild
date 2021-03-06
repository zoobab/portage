# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-perl/cvs-repo/gentoo-x86/dev-perl/Net-IRC/Net-IRC-0.790.0.ebuild,v 1.1 2012/06/16 17:05:20 tove Exp $

EAPI=2

MODULE_AUTHOR="APEIRON"
MODULE_VERSION=0.79
inherit perl-module

DESCRIPTION="Perl IRC module"

SLOT="0"
LICENSE="Artistic"
KEYWORDS="amd64 ~mips ppc x86"
IUSE=""

SRC_TEST="do"

mydoc="TODO"

src_prepare() {
	# Remove the stdin and warning input required re deprecated.
	sed -i \
		-e '/or die $warning/d' \
		-e '/my $acceptance/,/$acceptance eq $ok/d' \
		"${S}"/Makefile.PL
	perl-module_src_prepare
}
