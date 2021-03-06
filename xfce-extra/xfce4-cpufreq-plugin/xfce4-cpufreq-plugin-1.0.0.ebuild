# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/xfce-extra/cvs-repo/gentoo-x86/xfce-extra/xfce4-cpufreq-plugin/xfce4-cpufreq-plugin-1.0.0.ebuild,v 1.7 2012/05/05 07:10:55 mgorny Exp $

EAPI=4
inherit multilib xfconf

DESCRIPTION="A panel plugin for showing information about cpufreq settings"
HOMEPAGE="http://goodies.xfce.org/projects/panel-plugins/xfce4-cpufreq-plugin"
SRC_URI="mirror://xfce/src/panel-plugins/${PN}/1.0/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"
IUSE=""

RDEPEND="x11-libs/gtk+:2
	>=xfce-base/libxfce4util-4.8
	>=xfce-base/libxfcegui4-4.8
	>=xfce-base/xfce4-panel-4.8"
DEPEND="${RDEPEND}
	dev-util/intltool
	virtual/pkgconfig
	sys-devel/gettext"

pkg_setup() {
	XFCONF=(
		--libexecdir="${EPREFIX}"/usr/$(get_libdir)
		)

	DOCS=( AUTHORS ChangeLog NEWS README )
}
