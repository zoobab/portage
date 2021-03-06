# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-misc/cvs-repo/gentoo-x86/net-misc/bwwhois/bwwhois-5.0-r1.ebuild,v 1.5 2012/07/29 17:23:17 armin76 Exp $

inherit perl-app

MY_P=${P/bw/}

DESCRIPTION="Perl-based whois client designed to work with the new Shared Registration System"
SRC_URI="http://whois.bw.org/dist/${MY_P}.tgz"
HOMEPAGE="http://whois.bw.org/"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_install() {
	exeinto usr/bin
	newexe whois bwwhois || die

	newman whois.1 bwwhois.1 || die

	insinto /etc/whois
	doins whois.conf tld.conf sd.conf || die

	perlinfo
	insinto "${VENDOR_LIB}"
	doins bwInclude.pm || die
}
