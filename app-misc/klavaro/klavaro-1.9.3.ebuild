# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-misc/cvs-repo/gentoo-x86/app-misc/klavaro/klavaro-1.9.3.ebuild,v 1.2 2012/02/13 23:13:15 tetromino Exp $

EAPI=4

DESCRIPTION="Another free touch typing tutor program"
HOMEPAGE="http://klavaro.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-misc/curl
	>=x11-libs/gtk+-2.16.6:2
	x11-libs/gtkdatabox"

DEPEND="${RDEPEND}
	sys-devel/gettext
	|| ( dev-util/gtk-builder-convert <=x11-libs/gtk+-2.24.10:2 )"

DOCS=( AUTHORS ChangeLog NEWS README TODO )
