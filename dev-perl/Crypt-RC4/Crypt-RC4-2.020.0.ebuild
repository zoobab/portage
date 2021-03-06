# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-perl/cvs-repo/gentoo-x86/dev-perl/Crypt-RC4/Crypt-RC4-2.020.0.ebuild,v 1.11 2012/09/11 15:37:35 armin76 Exp $

EAPI=4

MODULE_AUTHOR=SIFUKURT
MODULE_VERSION=2.02
inherit perl-module

DESCRIPTION="Implements the RC4 encryption algorithm"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~s390 ~sh ~sparc x86 ~ppc-aix ~amd64-fbsd ~x86-fbsd ~ppc-macos ~x64-macos ~x86-macos ~x64-solaris ~x86-solaris"
IUSE=""

SRC_TEST="do"
