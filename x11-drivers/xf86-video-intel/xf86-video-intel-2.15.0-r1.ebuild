# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-drivers/cvs-repo/gentoo-x86/x11-drivers/xf86-video-intel/xf86-video-intel-2.15.0-r1.ebuild,v 1.7 2012/07/04 22:13:45 remi Exp $

EAPI=4

XORG_DRI=dri
inherit linux-info xorg-2

DESCRIPTION="X.Org driver for Intel cards"

KEYWORDS="amd64 ia64 x86 -x86-fbsd"
IUSE=""

RDEPEND="x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXvMC
	>=x11-libs/libdrm-2.4.23[video_cards_intel]
	>=x11-libs/libxcb-1.5
	x11-libs/xcb-util"
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/xf86-video-intel-2.15-batch-overrun.patch"
	"${FILESDIR}/xf86-video-intel-2.15-unsigned-promotion.patch"
)

pkg_setup() {
	linux-info_pkg_setup
	xorg-2_pkg_setup
	XORG_CONFIGURE_OPTIONS=(
		$(use_enable dri)
		--enable-xvmc
	)
}

pkg_postinst() {
	if linux_config_exists \
		&& ! linux_chkconfig_present DRM_I915_KMS; then
		echo
		ewarn "This driver requires KMS support in your kernel"
		ewarn "  Device Drivers --->"
		ewarn "    Graphics support --->"
		ewarn "      Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)  --->"
		ewarn "      <*>   Intel 830M, 845G, 852GM, 855GM, 865G (i915 driver)  --->"
		ewarn "              i915 driver"
		ewarn "      [*]       Enable modesetting on intel by default"
		echo
	fi
}
