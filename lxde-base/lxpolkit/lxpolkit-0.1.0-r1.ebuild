# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/lxde-base/cvs-repo/gentoo-x86/lxde-base/lxpolkit/lxpolkit-0.1.0-r1.ebuild,v 1.5 2012/05/04 05:50:41 jdhore Exp $

EAPI=4

DESCRIPTION="A simple PolicyKit authentication agent"
HOMEPAGE="http://lxde.git.sourceforge.net/git/gitweb.cgi?p=lxde/lxpolkit;a=summary http://blog.lxde.org/?p=674"
SRC_URI="mirror://sourceforge/project/lxde/LXPolkit/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=sys-auth/polkit-0.102
	x11-libs/gtk+:3
	!gnome-extra/polkit-gnome"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.40.0
	virtual/pkgconfig
	sys-devel/gettext"

src_prepare() {
	local f=data/lxpolkit.desktop.in.in
	sed -i -e '/^NotShowIn/s:=.*:=KDE;:' ${f} || die
	echo 'AutostartCondition=GNOME3 if-session gnome-fallback' >> ${f}
}

src_configure() { econf --enable-gtk3; }
