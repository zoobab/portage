# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-misc/cvs-repo/gentoo-x86/net-misc/netprofiles-ims/netprofiles-ims-0.1.0134.ebuild,v 1.5 2007/04/29 00:45:53 swegener Exp $

DESCRIPTION="The Netprofiles Interface Management System (IMS) is an easy way to manage multiple network configurations for your wired or wireless network cards."

HOMEPAGE="http://www.furuba.net/~buckminst/gentoo/"
SRC_URI="http://www.furuba.net/~buckminst/gentoo/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""
DEPEND=""

src_install() {
	dosbin netprofiles
	doinitd netprofiles-ims
}
