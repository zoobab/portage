# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/perl-core/cvs-repo/gentoo-x86/perl-core/Math-BigRat/Math-BigRat-0.260.200.ebuild,v 1.4 2012/09/01 12:08:19 grobian Exp $

EAPI=3

MODULE_AUTHOR=PJACKLAM
MODULE_VERSION=0.2602
inherit perl-module

DESCRIPTION="Arbitrary big rational numbers"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~s390 ~sh ~sparc ~x86 ~ppc-aix ~ppc-macos ~x86-solaris"
IUSE=""

DEPEND=">=perl-core/Math-BigInt-1.991"
RDEPEND="${DEPEND}"

SRC_TEST="do"
