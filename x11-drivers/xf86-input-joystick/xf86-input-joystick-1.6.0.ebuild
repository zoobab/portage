# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-drivers/cvs-repo/gentoo-x86/x11-drivers/xf86-input-joystick/xf86-input-joystick-1.6.0.ebuild,v 1.8 2011/08/20 15:52:01 jer Exp $

EAPI=4
inherit xorg-2

DESCRIPTION="X.Org driver for joystick input devices"

KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 sh sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=x11-base/xorg-server-1.10"
DEPEND="${RDEPEND}
	x11-proto/inputproto
	x11-proto/kbproto"
