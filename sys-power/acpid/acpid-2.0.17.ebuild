# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-power/cvs-repo/gentoo-x86/sys-power/acpid/acpid-2.0.17.ebuild,v 1.1 2012/09/16 16:20:05 ssuominen Exp $

EAPI=4
inherit systemd

DESCRIPTION="Daemon for Advanced Configuration and Power Interface"
HOMEPAGE="http://tedfelix.com/linux/acpid-netlink.html"
SRC_URI="http://tedfelix.com/linux/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ia64 -ppc ~x86"
IUSE=""

src_configure() {
	econf --docdir=/usr/share/doc/${PF}
}

src_install() {
	emake DESTDIR="${D}" install

	newdoc kacpimon/README README.kacpimon
	dodoc -r samples
	rm -f "${D}"/usr/share/doc/${PF}/COPYING

	exeinto /etc/acpi
	newexe "${FILESDIR}"/${PN}-1.0.6-default.sh default.sh
	insinto /etc/acpi/events
	newins "${FILESDIR}"/${PN}-1.0.4-default default

	newinitd "${FILESDIR}"/${PN}-2.0.16-init.d ${PN}
	newconfd "${FILESDIR}"/${PN}-2.0.16-conf.d ${PN}

	systemd_dounit "${FILESDIR}"/systemd/${PN}.{service,socket}
}

pkg_postinst() {
	elog
	elog "You may wish to read the Gentoo Linux Power Management Guide,"
	elog "which can be found online at:"
	elog "http://www.gentoo.org/doc/en/power-management-guide.xml"
	elog

	# files/systemd/acpid.socket -> ListenStream=/run/acpid.socket
	mkdir -p "${ROOT}"/run

	if ! grep -qs "^tmpfs.*/run " "${ROOT}"/proc/mounts ; then
		echo
		ewarn "You should reboot the system now to get /run mounted with tmpfs!"
	fi
}
