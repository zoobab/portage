# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/gnustep-libs/cvs-repo/gentoo-x86/gnustep-libs/pantomime/pantomime-1.2.0.ebuild,v 1.4 2012/06/07 18:43:54 xmw Exp $

EAPI=4
inherit eutils gnustep-2

MY_P=${P/p/P}

S=${WORKDIR}/${MY_P}

DESCRIPTION="A set of Objective-C classes that model a mail system."
HOMEPAGE="http://www.collaboration-world.com/pantomime/"
SRC_URI="http://download.gna.org/gnustep-nonfsf/${MY_P}.tar.gz"

LICENSE="LGPL-2.1 Elm"
KEYWORDS="amd64 ppc x86 ~x86-fbsd"
SLOT="0"
IUSE=""

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e "s|ADDITIONAL_LDFLAGS|LIBRARIES_DEPEND_UPON|" \
		Framework/Pantomime/GNUmakefile || die "as-needed sed failed"
}

src_install() {
	gnustep-base_src_install

	cd "${S}"/Documentation
	dodoc AUTHORS README TODO
	docinto rfc
	dodoc RFC/*
}
