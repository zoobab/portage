# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-base/cvs-repo/gentoo-x86/kde-base/kdepim-runtime/kdepim-runtime-4.8.5.ebuild,v 1.4 2012/09/03 12:20:22 scarabeus Exp $

EAPI=4

KMNAME="kdepim-runtime"
KDE_SCM="git"
inherit kde4-base

DESCRIPTION="KDE PIM runtime plugin collection"
KEYWORDS="amd64 ~arm ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

RESTRICT="test"
# Would need test programs _testrunner and akonaditest from kdepimlibs, see bug 313233

DEPEND="
	app-misc/strigi
	>=app-office/akonadi-server-1.7.0
	dev-libs/boost
	dev-libs/libxml2:2
	dev-libs/libxslt
	dev-libs/shared-desktop-ontologies
	$(add_kdebase_dep kdepimlibs 'semantic-desktop')
	x11-misc/shared-mime-info
"
RDEPEND="${DEPEND}
	$(add_kdebase_dep kdepim-icons)
"

# nepomuk_email_feeder moved here in 4.8
add_blocker kdepim-common-libs 4.7.50
