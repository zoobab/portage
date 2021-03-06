# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-firewall/cvs-repo/gentoo-x86/net-firewall/gshield/gshield-2.8-r3.ebuild,v 1.2 2012/01/28 14:49:05 phajdan.jr Exp $

EAPI="4"

DESCRIPTION="iptables firewall configuration system"
HOMEPAGE="http://muse.linuxmafia.org/gshield.html"
SRC_URI="ftp://muse.linuxmafia.org/pub/gShield/v2/gShield-${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc x86"
IUSE=""

RDEPEND="net-firewall/iptables
	net-dns/bind-tools
	virtual/logger"

src_unpack() {
	# set S=${P}
	unpack ${A}
	mv * ${P} || die
}

src_install() {
	# install config files
	dodir /etc/gshield
	cp -pPR * "${D}"/etc/gshield || die
	ln -s gshield "${D}"/etc/firewall || die

	# get rid of docs from config
	rm -r "${D}"/etc/gshield/{Changelog,INSTALL,LICENSE,docs} || die

	# move non-config stuff out of config, but make symlinks
	dodir /usr/share/gshield/routables
	for q in gShield-version gShield.rc tools sourced routables/routable.rules
	do
		mv "${D}"/etc/gshield/$q "${D}"/usr/share/gshield/ || die
		ln -s /usr/share/gshield/$q "${D}"/etc/gshield/$q || die
	done
	chmod -R u+rwX "${D}"/etc/gshield || die

	# install init script
	newinitd "${FILESDIR}"/gshield.init gshield
	chmod -R u+rwx "${D}"/etc/init.d/gshield || die

	# install docs
	dodoc Changelog docs/*
}
