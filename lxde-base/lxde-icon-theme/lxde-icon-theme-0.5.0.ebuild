# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/lxde-base/cvs-repo/gentoo-x86/lxde-base/lxde-icon-theme/lxde-icon-theme-0.5.0.ebuild,v 1.5 2012/08/14 22:11:05 johu Exp $

EAPI="4"

DESCRIPTION="nuoveXT2 iconset"
HOMEPAGE="http://lxde.sf.net/"
SRC_URI="mirror://sourceforge/lxde/LXDE%20Icon%20Theme/${P}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm ppc x86"
IUSE=""

RDEPEND="x11-libs/gtk+:2"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	sys-devel/gettext
	!<lxde-base/lxde-common-0.5.0"
