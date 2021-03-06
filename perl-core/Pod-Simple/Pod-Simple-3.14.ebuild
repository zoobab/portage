# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/perl-core/cvs-repo/gentoo-x86/perl-core/Pod-Simple/Pod-Simple-3.14.ebuild,v 1.9 2011/07/30 12:23:01 tove Exp $

EAPI=3

MODULE_AUTHOR=DWHEELER
inherit perl-module

DESCRIPTION="Framework for parsing Pod"

SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux ~x86-macos"
IUSE=""

DEPEND=">=virtual/perl-Pod-Escapes-1.04"
RDEPEND="${DEPEND}"

SRC_TEST="do"
