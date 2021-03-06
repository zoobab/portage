# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/perl-core/cvs-repo/gentoo-x86/perl-core/Math-BigInt/Math-BigInt-1.997.0.ebuild,v 1.2 2012/09/01 12:07:13 grobian Exp $

EAPI=4

MODULE_AUTHOR=PJACKLAM
MODULE_VERSION=1.997
inherit perl-module eutils

DESCRIPTION="Arbitrary size floating point math package"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~s390 ~sh ~sparc ~x86 ~ppc-aix ~ppc-macos ~x86-solaris"
IUSE=""

RDEPEND=">=virtual/perl-Scalar-List-Utils-1.140.0"
DEPEND="${RDEPEND}"

PDEPEND=">=virtual/perl-Math-BigInt-FastCalc-0.270.0
	>=perl-core/bignum-0.220.0
	>=perl-core/Math-BigRat-0.260.200"

SRC_TEST="do"
