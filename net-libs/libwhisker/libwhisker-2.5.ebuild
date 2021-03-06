# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-libs/cvs-repo/gentoo-x86/net-libs/libwhisker/libwhisker-2.5.ebuild,v 1.1 2010/02/20 09:02:59 tove Exp $

EAPI=2

inherit perl-module
MY_P=${PN}2-${PV}

DESCRIPTION="Perl module geared to HTTP testing"
HOMEPAGE="http://www.wiretrip.net/rfp/lw.asp"
SRC_URI="http://www.wiretrip.net/rfp/libwhisker/${MY_P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="ssl"

DEPEND=""
RDEPEND="virtual/perl-MIME-Base64
	ssl? ( dev-perl/Net-SSLeay )"

S=${WORKDIR}/${MY_P}

src_compile() {
	perl Makefile.pl lib || die
}

src_install() {
	perlinfo
	insinto "${VENDOR_LIB}"
	doins LW2.pm || die
	dodoc CHANGES KNOWNBUGS README || die
}
