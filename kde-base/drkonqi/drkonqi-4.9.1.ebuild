# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-base/cvs-repo/gentoo-x86/kde-base/drkonqi/drkonqi-4.9.1.ebuild,v 1.1 2012/09/04 18:45:27 johu Exp $

EAPI=4

KMNAME="kde-runtime"
inherit kde4-meta

DESCRIPTION="KDE crash handler, gives the user feedback if a program crashed"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep kdepimlibs)
"
RDEPEND="${DEPEND}"

pkg_postinst() {
	kde4-meta_pkg_postinst
	if ! has_version "sys-devel/gdb"; then
		elog "For more usability consider installing following packages:"
		elog "    sys-devel/gdb - Easier debugging support"
	fi
}
