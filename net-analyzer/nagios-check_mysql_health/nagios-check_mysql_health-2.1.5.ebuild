# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-analyzer/cvs-repo/gentoo-x86/net-analyzer/nagios-check_mysql_health/nagios-check_mysql_health-2.1.5.ebuild,v 1.1 2011/04/07 15:11:17 hollow Exp $

EAPI="2"

inherit multilib autotools

DESCRIPTION="A nagios plugin for checking MySQL server health"
HOMEPAGE="http://labs.consol.de/lang/de/nagios/check_mysql_health/"
SRC_URI="http://labs.consol.de/wp-content/uploads/2010/12/check_mysql_health-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-analyzer/nagios-plugins-1.4.13-r1"
RDEPEND="${DEPEND}
	virtual/mysql"

S="${WORKDIR}"/check_mysql_health-${PV}

src_prepare() {
	eautoreconf
}

src_install() {
	exeinto /usr/$(get_libdir)/nagios/plugins
	doexe plugins-scripts/check_mysql_health
}
