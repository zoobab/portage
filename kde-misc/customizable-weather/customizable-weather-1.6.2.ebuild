# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-misc/cvs-repo/gentoo-x86/kde-misc/customizable-weather/customizable-weather-1.6.2.ebuild,v 1.3 2012/06/29 09:16:48 johu Exp $

EAPI=4

KDE_LINGUAS="br de el es fr hu it nb nl pl ro ru sr sr@latin tr zh_CN"
inherit kde4-base

MY_P="cwp-${PV}"

DESCRIPTION="KDE4 weather plasmoid. It aims to be highly customizable, but is a little harder to setup."
HOMEPAGE="http://www.kde-look.org/content/show.php/Customizable+Weather+Plasmoid?content=98925"
SRC_URI="http://www.kde-look.org/CONTENT/content-files/98925-${MY_P}.tar.bz2"

LICENSE="GPL-3"
KEYWORDS="amd64 x86"
SLOT="4"
IUSE="debug"

RDEPEND="
	$(add_kdebase_dep plasma-workspace)
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"
