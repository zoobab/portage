# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-emacs/cvs-repo/gentoo-x86/app-emacs/proofgeneral/proofgeneral-3.7.1.ebuild,v 1.5 2010/02/11 09:56:22 ulm Exp $

inherit elisp

MY_PN="ProofGeneral"
DESCRIPTION="A generic interface for proof assistants"
HOMEPAGE="http://proofgeneral.inf.ed.ac.uk/"
SRC_URI="http://proofgeneral.inf.ed.ac.uk/releases/${MY_PN}-${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

S="${WORKDIR}/${MY_PN}-${PV}"
SITEFILE="50${PN}-gentoo.el"

src_compile() {
	emake -j1 compile EMACS=emacs || die "compile failed"
}

src_install() {
	emake -j1 install EMACS=emacs PREFIX="${D}"/usr || die "install failed"
	elisp-site-file-install "${FILESDIR}/${SITEFILE}" ${MY_PN} || die

	doinfo doc/*.info* || die
	doman doc/proofgeneral.1 || die
	dohtml doc/ProofGeneral/*.html doc/PG-adapting/*.html || die
	dodoc AUTHORS BUGS CHANGES COMPATIBILITY FAQ FUTURE INSTALL README REGISTER

	# clean up
	rm -rf "${D}/usr/share/emacs/site-lisp/site-start.d"
	rm -rf "${D}/usr/share/application-registry"
	rm -rf "${D}/usr/share/mime-info"
}

pkg_postinst() {
	elisp-site-regen
	elog "Please register your use of Proof General on the web at:"
	elog "  http://proofgeneral.inf.ed.ac.uk/register "
	elog "(see the REGISTER file for more information)"
}
