# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-base/cvs-repo/gentoo-x86/kde-base/libkworkspace/libkworkspace-4.9.2.ebuild,v 1.1 2012/10/02 18:12:12 johu Exp $

EAPI=4

KMNAME="kde-workspace"
KMMODULE="libs/kworkspace"
inherit kde4-meta

DESCRIPTION="A library for KDE desktop applications"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

KMEXTRACTONLY="
	ksmserver/org.kde.KSMServerInterface.xml
	kwin/org.kde.KWin.xml
"

KMSAVELIBS="true"

DEPEND="
	x11-libs/libxkbfile
	x11-libs/libXcomposite
"
RDEPEND=${DEPEND}

src_prepare() {
	sed -i -e 's/install( FILES kdisplaymanager.h/install( FILES kdisplaymanager.h screenpreviewwidget.h/' \
		libs/kworkspace/CMakeLists.txt || die "failed to provide screenpreviewwidget.h"

	kde4-meta_src_prepare
}
