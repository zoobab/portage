# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/xfce-extra/cvs-repo/gentoo-x86/xfce-extra/xfce4-embed-plugin/xfce4-embed-plugin-1.0.0.ebuild,v 1.2 2012/05/05 07:14:40 mgorny Exp $

EAPI=4
inherit xfconf

DESCRIPTION="A plug-in for embedding arbitrary application windows into the Xfce panel"
HOMEPAGE="http://goodies.xfce.org/projects/panel-plugins/xfce4-embed-plugin"
SRC_URI="mirror://xfce/src/panel-plugins/${PN}/${PV%.*}/${P}.tar.bz2"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND=">=x11-libs/gtk+-2.20:2
	x11-libs/libX11
	>=xfce-base/libxfce4ui-4.8
	>=xfce-base/libxfce4util-4.8
	>=xfce-base/xfce4-panel-4.8"
DEPEND="${RDEPEND}
	dev-util/intltool
	virtual/pkgconfig
	sys-devel/gettext"

pkg_setup() {
	XFCONF=(
		$(xfconf_use_debug)
		)

	DOCS=( AUTHORS ChangeLog NEWS README THANKS )
}
