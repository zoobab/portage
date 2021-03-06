# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-auth/cvs-repo/gentoo-x86/sys-auth/pam_chroot/pam_chroot-0.9.2.ebuild,v 1.3 2011/05/16 09:09:19 flameeyes Exp $

inherit toolchain-funcs pam flag-o-matic eutils

DESCRIPTION="Linux-PAM module that allows a user to be chrooted in auth, account, or session."
HOMEPAGE="http://sourceforge.net/projects/pam-chroot/"
SRC_URI="mirror://sourceforge/pam-chroot/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

DEPEND="virtual/pam
	!<sys-libs/pam-0.99"
RDEPEND="${DEPEND}"

doecho() {
	echo "$@"
	"$@" || die
}

src_compile() {
	# using the Makefile would require patching it to work properly, so
	# rather simply re-create it here.
	doecho $(tc-getCC) ${LDFLAGS} -shared -fPIC ${CFLAGS} ${PN}.c -o ${PN}.so -lpam
}

src_install() {
	dopammod pam_chroot.so
	dopamsecurity  . chroot.conf

	dodoc CREDITS README.history TROUBLESHOOTING options || die "dodoc failed"
}
