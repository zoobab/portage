# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-analyzer/cvs-repo/gentoo-x86/net-analyzer/nikto/nikto-2.03.ebuild,v 1.2 2010/05/26 16:38:56 abcd Exp $

EAPI="3"

DESCRIPTION="Web Server vulnerability scanner."
HOMEPAGE="http://www.cirt.net/code/nikto.shtml"
SRC_URI="http://www.cirt.net/source/nikto/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~amd64-linux ~x86-linux ~x86-macos"
IUSE="ssl"

RDEPEND="dev-lang/perl
		>=net-analyzer/nmap-3.00
		ssl? (
			dev-libs/openssl
			dev-perl/Net-SSLeay
		)"

S=${WORKDIR}/${PN}

src_prepare() {
	mv config.txt nikto.conf

	sed -i -e 's:config.txt:nikto.conf:g' \
		plugins/* docs/nikto.1 nikto.pl || die

	sed	-i -e 's:config.txt:nikto.conf:' \
		-i -e "s:\(\$NIKTO{configfile} = \)\"nikto.conf\":\1\"${EPREFIX}/etc/nikto/nikto.conf\":" \
		nikto.pl || die

	sed -i -e "s:/usr/local/bin/nmap:${EPREFIX}/usr/bin/nmap:" \
		-i -e "s:# EXECDIR=/usr/local/nikto:EXECDIR=${EPREFIX}/usr/share/nikto:" \
		nikto.conf || die

	find -depth -name .svn -type d -exec rm -rf {} +
}

src_install() {
	insinto /etc/nikto
	doins nikto.conf || die

	dobin nikto.pl || die
	dosym nikto.pl /usr/bin/nikto || die

	dodir /usr/share/nikto
	insinto /usr/share/nikto
	doins -r plugins templates || die

	dodoc plugins/nikto_plugin_order.txt
	dodoc docs/*.txt
	dohtml docs/nikto_manual.html
}
