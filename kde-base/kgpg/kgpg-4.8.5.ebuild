# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-base/cvs-repo/gentoo-x86/kde-base/kgpg/kgpg-4.8.5.ebuild,v 1.4 2012/09/03 12:20:29 scarabeus Exp $

EAPI=4

KDE_HANDBOOK="optional"
KDE_SCM="git"
KDE_SELINUX_MODULE="gpg"
inherit kde4-base

DESCRIPTION="KDE gpg keyring manager"
KEYWORDS="amd64 ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep kdepimlibs)
"
RDEPEND="${DEPEND}
	app-crypt/gnupg
"

pkg_postinst() {
	kde4-base_pkg_postinst

	if ! has_version app-crypt/dirmngr ; then
		elog "For improved key search functionality, install app-crypt/dirmngr."
	fi
}
