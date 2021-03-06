# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-php/cvs-repo/gentoo-x86/dev-php/PEAR-Crypt_CHAP/PEAR-Crypt_CHAP-1.5.0.ebuild,v 1.9 2012/04/01 17:15:28 armin76 Exp $

EAPI="4"

inherit php-pear-r1

DESCRIPTION="Generating CHAP packets"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86"
IUSE=""

pkg_postinst() {
	if ! has_version "dev-lang/php[crypt,mhash]" ; then
		elog "${PN} can optionally use dev-lang/php crypt and mhash features."
		elog "If you want those, recompile dev-lang/php with these flags in USE."
	fi
}
