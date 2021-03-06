# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-admin/cvs-repo/gentoo-x86/app-admin/fifo-cronolog/fifo-cronolog-1.1.1.ebuild,v 1.2 2010/10/11 21:33:03 idl0r Exp $

EAPI=3

DESCRIPTION="cronolog wrapper for use with dumb daemons like squid, varnish and so on"
HOMEPAGE="http://git.overlays.gentoo.org/gitweb/?p=proj/fifo-cronolog.git"
SRC_URI="mirror://gentoo/${P}.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="app-admin/cronolog"

src_install() {
	dosbin fifo-cronolog || die

	newinitd fifo-cronolog.initd fifo-cronolog || die
	newconfd fifo-cronolog.confd fifo-cronolog || die

	dosym /usr/sbin/fifo-cronolog /usr/sbin/squid-cronolog || die
}

pkg_postinst() {
	elog "Warning: app-admin/squid-cronolog has been renamed to app-admin/fifo-cronolog."
	elog "This also applies to the binary 'squid-cronolog' but there is a symlink for now"
	elog "Please fix your scripts/configs."
}
