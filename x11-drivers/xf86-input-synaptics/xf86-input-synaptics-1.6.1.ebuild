# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-drivers/cvs-repo/gentoo-x86/x11-drivers/xf86-input-synaptics/xf86-input-synaptics-1.6.1.ebuild,v 1.3 2012/06/09 09:10:34 scarabeus Exp $

EAPI=4

inherit linux-info xorg-2

DESCRIPTION="Driver for Synaptics touchpads"
HOMEPAGE="http://cgit.freedesktop.org/xorg/driver/xf86-input-synaptics/"

KEYWORDS="~amd64 ~mips ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND="sys-libs/mtdev
	>=x11-base/xorg-server-1.8
	>=x11-libs/libXi-1.2
	>=x11-libs/libXtst-1.1.0"
DEPEND="${RDEPEND}
	>=sys-kernel/linux-headers-2.6.37
	>=x11-proto/recordproto-1.14"

DOCS=( "README" )

pkg_pretend() {
	linux-info_pkg_setup
	# Just a friendly warning
	if ! linux_config_exists \
			|| ! linux_chkconfig_present INPUT_EVDEV; then
		echo
		ewarn "This driver requires event interface support in your kernel"
		ewarn "  Device Drivers --->"
		ewarn "    Input device support --->"
		ewarn "      <*>     Event interface"
		echo
	fi
}
