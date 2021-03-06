# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/gnome-extra/cvs-repo/gentoo-x86/gnome-extra/at-spi/at-spi-2.2.0.ebuild,v 1.1 2011/11/16 01:55:34 tetromino Exp $

EAPI="4"

DESCRIPTION="The Gnome Accessibility Toolkit"
HOMEPAGE="http://projects.gnome.org/accessibility/"
SRC_URI=""

LICENSE="as-is"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=app-accessibility/at-spi2-atk-${PV}:2
	>=app-accessibility/at-spi2-core-${PV}:2
	>=dev-python/pyatspi-${PV}
	!<gnome-extra/at-spi-1.32.0-r1
"
DEPEND=""
