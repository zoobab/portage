# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-sound/cvs-repo/gentoo-x86/media-sound/volumeicon/volumeicon-0.4.6.ebuild,v 1.6 2012/06/11 09:20:29 ago Exp $

EAPI=4
inherit eutils

DESCRIPTION="A lightweight volume control that sits in your systray"
HOMEPAGE="http://softwarebakery.com/maato/volumeicon.html"
SRC_URI="http://softwarebakery.com/maato/files/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="libnotify"

RDEPEND=">=dev-libs/glib-2
	media-libs/alsa-lib
	>=x11-libs/gtk+-2.16:2
	x11-libs/libX11
	libnotify? ( >=x11-libs/libnotify-0.7 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog )

src_prepare() {
	epatch "${FILESDIR}"/${P}-glib-2.31.patch
}

src_configure() {
	# --enable-oss --with-oss-include-path=/usr/include/sys #419891
	econf $(use_enable libnotify notify)
}
