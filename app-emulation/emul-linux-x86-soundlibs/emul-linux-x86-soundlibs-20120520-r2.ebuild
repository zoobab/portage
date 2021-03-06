# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-emulation/cvs-repo/gentoo-x86/app-emulation/emul-linux-x86-soundlibs/emul-linux-x86-soundlibs-20120520-r2.ebuild,v 1.5 2012/09/24 00:41:07 vapier Exp $

EAPI="4"

inherit emul-linux-x86

LICENSE="BSD FDL-1.2 GPL-2 LGPL-2.1 LGPL-2 as-is gsm public-domain"
KEYWORDS="-* amd64"
IUSE="alsa"

RDEPEND="~app-emulation/emul-linux-x86-baselibs-${PV}
	~app-emulation/emul-linux-x86-medialibs-${PV}"

QA_FLAGS_IGNORED="usr/lib32/.*"

src_prepare() {
	_ALLOWED="${S}/etc/env.d"
	use alsa && _ALLOWED="${_ALLOWED}|${S}/usr/bin/aoss"
	ALLOWED="(${_ALLOWED})"

	emul-linux-x86_src_prepare

	if use alsa; then
		mv -f "${S}"/usr/bin/aoss{,32} || die
	fi
}
