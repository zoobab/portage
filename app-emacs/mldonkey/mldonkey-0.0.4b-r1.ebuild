# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-emacs/cvs-repo/gentoo-x86/app-emacs/mldonkey/mldonkey-0.0.4b-r1.ebuild,v 1.8 2011/11/11 22:14:23 ulm Exp $

EAPI=4

inherit elisp

MY_P="${PN}-el-${PV}"
DESCRIPTION="An Emacs Lisp interface to the MLDonkey core"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/MlDonkey
	http://web.archive.org/web/20070107165326/www.physik.fu-berlin.de/~dhansen/mldonkey/"
SRC_URI="http://www.physik.fu-berlin.de/%7Edhansen/mldonkey/files/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

S="${WORKDIR}/${MY_P}"
ELISP_PATCHES="${P}-vd.patch"
SITEFILE="50${PN}-gentoo.el"

src_compile() {
	elisp-compile ml*.el || die "elisp-compile failed"
}

pkg_postinst() {
	elisp-site-regen
	ewarn
	ewarn "If your network gets really slow when you use mldonkey,"
	ewarn "consider reducing the max number of connections. See bug #50510."
	ewarn
	elog "Remember to install net-p2p/mldonkey separately if you want to work"
	elog "with a local instance."
}
