# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-admin/cvs-repo/gentoo-x86/app-admin/perl-cleaner/perl-cleaner-2.10.ebuild,v 1.4 2012/04/26 13:22:47 aballier Exp $

DESCRIPTION="User land tool for cleaning up old perl installs"
HOMEPAGE="http://www.gentoo.org/proj/en/perl/"
SRC_URI="mirror://gentoo/${P}.tar.bz2
	http://dev.gentoo.org/~tove/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd"
IUSE=""

DEPEND="app-shells/bash"
RDEPEND="${DEPEND}
	|| ( >=sys-apps/coreutils-8.15 app-misc/realpath sys-freebsd/freebsd-bin )
	dev-lang/perl"

src_install() {
	dosbin perl-cleaner || die
	doman perl-cleaner.1 || die
}
