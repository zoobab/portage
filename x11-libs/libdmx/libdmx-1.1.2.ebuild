# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-libs/cvs-repo/gentoo-x86/x11-libs/libdmx/libdmx-1.1.2.ebuild,v 1.9 2012/08/26 18:54:13 armin76 Exp $

EAPI=4
inherit xorg-2

DESCRIPTION="X.Org dmx library"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	>=x11-proto/dmxproto-2.3
	x11-proto/xextproto"
DEPEND="${RDEPEND}"
