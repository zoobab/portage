# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-firewall/cvs-repo/gentoo-x86/net-firewall/ferm/ferm-2.1.ebuild,v 1.1 2012/08/07 19:12:37 kensington Exp $

inherit versionator

MY_PV="$(get_version_component_range 1-2)"
DESCRIPTION="Command line util for managing firewall rules"
HOMEPAGE="http://ferm.foo-projects.org/"
SRC_URI="http://ferm.foo-projects.org/download/${MY_PV}/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="amd64 ppc x86"
IUSE=""
SLOT="0"

DEPEND=""
RDEPEND="dev-lang/perl
	net-firewall/iptables"

src_install () {
	emake PREFIX="${D}/usr" DOCDIR="${D}/usr/share/doc/${PF}" install || die "emake install failed"
}

pkg_postinst() {
	einfo "See /usr/share/doc/${PF}/examples for sample configs"
}
