# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-misc/cvs-repo/gentoo-x86/net-misc/leechcraft-anhero/leechcraft-anhero-0.5.75.ebuild,v 1.1 2012/07/19 19:58:38 maksbotan Exp $

EAPI="4"

inherit leechcraft

DESCRIPTION="AnHero, KDE-based crash handler for LeechCraft."

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="~net-misc/leechcraft-core-${PV}
	>=kde-base/kdelibs-4.2.0"
RDEPEND="${DEPEND}"
