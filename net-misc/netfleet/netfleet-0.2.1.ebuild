# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-misc/cvs-repo/gentoo-x86/net-misc/netfleet/netfleet-0.2.1.ebuild,v 1.3 2010/06/29 08:51:13 fauli Exp $

EAPI="2"

inherit qt4-r2 versionator

MY_PV=$(replace_version_separator 3 '-')
MY_P="${PN}_${MY_PV}"

DESCRIPTION="Qt4 cross-platform multi-threaded download utility"
HOMEPAGE="http://qt-apps.org/content/show.php/?content=103312"
SRC_URI="http://netfleet.googlecode.com/files/${MY_P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND=">=x11-libs/qt-gui-4.5.0:4"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

DOCS="readme.txt"
