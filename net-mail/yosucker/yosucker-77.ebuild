# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-mail/cvs-repo/gentoo-x86/net-mail/yosucker/yosucker-77.ebuild,v 1.1 2007/03/30 00:01:03 ticho Exp $

MY_P="YoSucker-pr${PV}"
S=${WORKDIR}/${MY_P}
IUSE=""
DESCRIPTION="Perl script that downloads mail from a Yahoo! webmail account to a local mail spool, an mbox file, or to procmail."
SRC_URI="mirror://sourceforge/yosucker/${MY_P}.tar.gz"
HOMEPAGE="http://yosucker.sourceforge.net"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~ppc ~x86"

SLOT="0"

DEPEND="dev-lang/perl
		dev-perl/TermReadKey
		virtual/perl-Digest-MD5
		dev-perl/IO-Socket-SSL
		virtual/perl-MIME-Base64"

RDEPEND=""

src_install() {
	dobin bin/*
	mv utils/README utils/README.utils
	dodoc docs/*
	insinto /usr/share/doc/${P}/conf
	doins conf/*
	dolib lib/sputnik.pm

}

pkg_postinst() {
	echo
	ewarn "The Yahoo! Mail interface has changed!!"
	ewarn "If you have been using previous versions of YoSucker, you may need to"
	ewarn "log in to Yahoo! Mail  manually before it works again."
	echo
}
