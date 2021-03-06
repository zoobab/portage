# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-proxy/cvs-repo/gentoo-x86/net-proxy/leechcraft-xproxy/leechcraft-xproxy-0.5.70.ebuild,v 1.3 2012/07/07 10:19:57 johu Exp $

EAPI="4"

inherit leechcraft

DESCRIPTION="Provides advanced proxy support features for LeechCraft"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND="~net-misc/leechcraft-core-${PV}"
RDEPEND="${DEPEND}"
