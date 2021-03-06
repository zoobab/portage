# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-plugins/cvs-repo/gentoo-x86/x11-plugins/desklet-iCalendarEvent/desklet-iCalendarEvent-0.3.ebuild,v 1.4 2010/05/09 00:48:11 nixphoeni Exp $

EAPI=2
CONTROL_NAME="${PN#desklet-}"

inherit gdesklets

DESCRIPTION="iCalendarEvent Control for gDesklets"
HOMEPAGE="http://gdesklets.de/index.php?q=control/view/231"
LICENSE="GPL-2"
# KEYWORDS limited by dev-python/icalendar
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="${RDEPEND}
	>=dev-python/icalendar-2.0.1
	>=dev-python/python-dateutil-1.2
	dev-libs/libgamin[python]"
DOCS="Manifest"
