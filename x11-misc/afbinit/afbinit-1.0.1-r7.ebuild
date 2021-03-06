# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-misc/cvs-repo/gentoo-x86/x11-misc/afbinit/afbinit-1.0.1-r7.ebuild,v 1.3 2008/06/04 18:10:47 armin76 Exp $

inherit eutils

DESCRIPTION="loads the microcode for Elite3D framebuffers to use X"
HOMEPAGE="I dont have a home :("
SRC_URI="mirror://gentoo/${P}.tar.bz2"
IUSE=""

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="-* sparc"

RDEPEND="${DEPEND}
	sys-apps/util-linux"

src_unpack() {
	unpack ${A}
	##
	# Patch rc.afb to handle both kernels 2.4.x and 2.6.x
	einfo "Patching to handle both kernel 2.4.x and 2.6.x style afb identification"
	cd "${S}"
	epatch "${FILESDIR}"/rc.afb-${PVR}.patch || die "Cannot patch rc.afb init script"
	einfo 'Patching afbinit.c to use MMAP_PUBLIC (needed for kernels > 2.6.14)'
	epatch "${FILESDIR}"/afbinit-mmap-${PV}.patch || die "Cannot patch for mmap"
}

src_compile() {
	emake || die "make failed"
}

src_install() {
	dosbin afbinit
	dosbin rc.afb
	newinitd "${FILESDIR}"/afbinit.init afbinit
}

pkg_postinst() {
	einfo "To use afbinit, you'll need the AFB microcode."
	einfo "This is available via a Solaris install at /usr/lib/afb.ucode"
	einfo "or via sun.com"
}
