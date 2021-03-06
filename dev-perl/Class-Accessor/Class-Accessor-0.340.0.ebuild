# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-perl/cvs-repo/gentoo-x86/dev-perl/Class-Accessor/Class-Accessor-0.340.0.ebuild,v 1.9 2012/09/01 11:15:57 grobian Exp $

EAPI=4

MODULE_AUTHOR=KASEI
MODULE_VERSION=0.34
inherit perl-module

DESCRIPTION="Automated accessor generation"

SLOT="0"
KEYWORDS="alpha amd64 hppa ia64 ppc ppc64 sparc x86 ~ppc-aix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE=""

RDEPEND="dev-perl/Sub-Name"
DEPEND="${RDEPEND}"

SRC_TEST="do"
