# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-base/cvs-repo/gentoo-x86/kde-base/kdeedu-meta/kdeedu-meta-4.9.1.ebuild,v 1.1 2012/09/04 18:44:56 johu Exp $

EAPI=4
inherit kde4-meta-pkg

DESCRIPTION="KDE educational apps - merge this to pull in all kdeedu-derived packages"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="
	$(add_kdebase_dep analitza)
	$(add_kdebase_dep blinken)
	$(add_kdebase_dep cantor)
	$(add_kdebase_dep kalgebra)
	$(add_kdebase_dep kalzium)
	$(add_kdebase_dep kanagram)
	$(add_kdebase_dep kbruch)
	$(add_kdebase_dep kgeography)
	$(add_kdebase_dep khangman)
	$(add_kdebase_dep kig)
	$(add_kdebase_dep kiten)
	$(add_kdebase_dep klettres)
	$(add_kdebase_dep kmplot)
	$(add_kdebase_dep kstars)
	$(add_kdebase_dep ktouch)
	$(add_kdebase_dep kturtle)
	$(add_kdebase_dep kwordquiz)
	$(add_kdebase_dep libkdeedu)
	$(add_kdebase_dep marble)
	$(add_kdebase_dep pairs)
	$(add_kdebase_dep parley)
	$(add_kdebase_dep rocs)
	$(add_kdebase_dep step)
"
