# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/www-client/cvs-repo/gentoo-x86/www-client/leechcraft-dolozhee/leechcraft-dolozhee-0.5.75.ebuild,v 1.1 2012/07/19 20:18:35 maksbotan Exp $

EAPI="4"

inherit leechcraft

DESCRIPTION="An issue reporting client for LeechCraft's issue tracker"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="~net-misc/leechcraft-core-${PV}"
RDEPEND="${DEPEND}"
