# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-portage/cvs-repo/gentoo-x86/app-portage/prefix-chain-setup/prefix-chain-setup-0.4-r5.ebuild,v 1.1 2010/10/29 09:59:31 mduft Exp $

inherit prefix

DESCRIPTION="Chained EPREFIX bootstrapping utility"
HOMEPAGE="http://dev.gentoo.org/~mduft"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~ppc-aix ~ia64-hpux ~x86-interix ~x86-linux ~sparc-solaris ~x86-solaris"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	cp "${FILESDIR}"/prefix-chain-setup.in "${T}"/prefix-chain-setup
	eprefixify "${T}"/prefix-chain-setup
	dobin "${T}"/prefix-chain-setup
}
