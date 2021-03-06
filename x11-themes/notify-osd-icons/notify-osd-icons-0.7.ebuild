# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-themes/cvs-repo/gentoo-x86/x11-themes/notify-osd-icons/notify-osd-icons-0.7.ebuild,v 1.1 2011/03/27 20:32:52 ssuominen Exp $

EAPI=2

DESCRIPTION="Icons for on-screen-display notification agent"
HOMEPAGE="http://launchpad.net/notify-osd"
SRC_URI="mirror://ubuntu/pool/main/n/${PN}/${PN}_${PV}.tar.gz"

LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-misc/notify-osd"
DEPEND=""

S=${WORKDIR}/${PN}

src_install() {
	emake DESTDIR="${D}" install || die

	# Source: debian/notify-osd-icons.links
	local path=/usr/share/notify-osd/icons/gnome/scalable/status
	dosym notification-battery-000.svg ${path}/notification-battery-empty.svg
	dosym notification-battery-020.svg ${path}/notification-battery-low.svg

	dodoc AUTHORS debian/changelog
}
