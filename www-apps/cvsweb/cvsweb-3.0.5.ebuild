# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/www-apps/cvs-repo/gentoo-x86/www-apps/cvsweb/cvsweb-3.0.5.ebuild,v 1.2 2010/06/19 00:58:35 abcd Exp $

inherit webapp

DESCRIPTION="WWW interface to a CVS tree"
HOMEPAGE="http://www.freebsd.org/projects/cvsweb.html"
SRC_URI="ftp://ftp.freebsd.org/pub/FreeBSD/ports/local-distfiles/scop/${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~x86 ~sparc ~ppc"
IUSE=""

RDEPEND=">=dev-lang/perl-5.8
	>=dev-vcs/cvs-1.11
	>=dev-vcs/rcs-5.7
	>=dev-perl/URI-1.28
	dev-perl/IPC-Run
	dev-perl/MIME-Types
	dev-perl/String-Ediff
	>=dev-vcs/cvsgraph-1.4.0
	>=app-text/enscript-1.6.3"

src_install() {
	webapp_src_preinst

	cp cvsweb.conf "${D}"/${MY_HOSTROOTDIR}
	cp css/cvsweb.css "${D}"/${MY_HTDOCSDIR}
	exeinto ${MY_CGIBINDIR}
	doexe cvsweb.cgi
	chmod +x "${D}"/${MY_CGIBINDIR}/cvsweb.cgi

	dodoc README TODO NEWS ChangeLog

	webapp_hook_script "${FILESDIR}"/reconfig
	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt
	webapp_src_install
}
