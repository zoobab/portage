# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-base/cvs-repo/gentoo-x86/kde-base/kdesdk-scripts/kdesdk-scripts-4.9.2.ebuild,v 1.1 2012/10/02 18:12:04 johu Exp $

EAPI=4

KDE_HANDBOOK="optional"
KMNAME="kdesdk"
KMMODULE="scripts"
KDE_SCM="svn"
inherit kde4-meta

DESCRIPTION="KDE SDK Scripts"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

RDEPEND="
	app-arch/advancecomp
"

src_prepare() {
	# bug 275069
	sed -ie 's:colorsvn::' scripts/CMakeLists.txt || die

	kde4-meta_src_prepare
}
