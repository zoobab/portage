# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/www-servers/cvs-repo/gentoo-x86/www-servers/spawn-fcgi/spawn-fcgi-1.6.3-r1.ebuild,v 1.8 2012/07/12 15:33:17 axs Exp $

EAPI=4

DESCRIPTION="A FCGI spawner for lighttpd and cherokee and other webservers"
HOMEPAGE="http://redmine.lighttpd.net/projects/spawn-fcgi"
SRC_URI="http://www.lighttpd.net/download/${P}.tar.bz2"

LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ~ppc64 sh sparc x86"
IUSE="ipv6"

DEPEND=""
RDEPEND="!<=www-servers/lighttpd-1.4.20
	!<=www-servers/cherokee-0.98.1"

src_configure() {
	econf $(use_enable ipv6)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README NEWS

	newconfd "${FILESDIR}"/spawn-fcgi.confd spawn-fcgi
	newinitd "${FILESDIR}"/spawn-fcgi.initd-r1 spawn-fcgi

	docinto examples
	dodoc doc/run-generic doc/run-php doc/run-rails
}
