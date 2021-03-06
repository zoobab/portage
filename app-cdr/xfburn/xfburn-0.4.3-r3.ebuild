# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-cdr/cvs-repo/gentoo-x86/app-cdr/xfburn/xfburn-0.4.3-r3.ebuild,v 1.8 2012/05/31 03:09:08 zmedico Exp $

EAPI=4
EAUTORECONF=yes
inherit eutils xfconf

DESCRIPTION="GTK+ based CD and DVD burning application"
HOMEPAGE="http://goodies.xfce.org/projects/applications/xfburn"
SRC_URI="mirror://xfce/src/apps/${PN}/${PV%.*}/${P}.tar.bz2
	mirror://debian/pool/main/x/${PN}/${PN}_${PV}-4.debian.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE="debug gstreamer udev"

RDEPEND=">=dev-libs/glib-2.22
	>=dev-libs/libburn-0.4.2
	>=dev-libs/libisofs-0.6.2
	>=x11-libs/gtk+-2.10:2
	>=xfce-base/exo-0.6
	>=xfce-base/libxfce4ui-4.8
	gstreamer? ( >=media-libs/gst-plugins-base-0.10.20:0.10 )
	udev? ( || ( >=sys-fs/udev-171-r1[gudev] <sys-fs/udev-171-r1[extras] ) )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	dev-util/intltool
	sys-devel/gettext"

pkg_setup() {
	PATCHES=(
		"${FILESDIR}"/${P}-update_desktop_entry.patch
		"${FILESDIR}"/${P}-empty_directory_segmentation_fault-2.patch
		"${FILESDIR}"/${P}-gobject_h.patch
		)

	XFCONF=(
		$(use_enable udev gudev)
		$(use_enable gstreamer)
		$(xfconf_use_debug)
		)

	DOCS=( AUTHORS ChangeLog NEWS README TODO )
}

src_prepare() {
	EPATCH_FORCE=yes EPATCH_SUFFIX=patch EPATCH_SOURCE="${WORKDIR}"/debian/patches epatch
	xfconf_src_prepare
}
