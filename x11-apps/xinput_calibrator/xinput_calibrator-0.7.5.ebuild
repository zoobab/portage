# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-apps/cvs-repo/gentoo-x86/x11-apps/xinput_calibrator/xinput_calibrator-0.7.5.ebuild,v 1.4 2012/04/23 17:23:37 mgorny Exp $

EAPI=4
inherit autotools-utils

DESCRIPTION="A generic touchscreen calibration program for X.Org"
HOMEPAGE="http://www.freedesktop.org/wiki/Software/xinput_calibrator"
SRC_URI="mirror://github/tias/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="gtk"

DEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXrandr
	x11-proto/inputproto
	gtk? ( dev-cpp/gtkmm:2.4 )"
RDEPEND="${DEPEND}"

src_configure() {
	local myeconfargs=(
		--with-gui=$(use gtk && echo "gtkmm" || echo "x11")
	)
	autotools-utils_src_configure
}
