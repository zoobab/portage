# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-libs/cvs-repo/gentoo-x86/net-libs/miniupnpc/miniupnpc-1.6.20120509.ebuild,v 1.6 2012/07/03 16:20:49 ranger Exp $

EAPI=4
inherit multilib toolchain-funcs

DESCRIPTION="UPnP client library and a simple UPnP client"
HOMEPAGE="http://miniupnp.free.fr/"
SRC_URI="http://miniupnp.free.fr/files/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm ppc ppc64 x86 ~x86-fbsd"
IUSE="kernel_linux static-libs"

RESTRICT="test" #409349

RDEPEND=""
DEPEND="kernel_linux? ( sys-apps/lsb-release sys-apps/which )"

src_prepare() {
	sed -i -e '/CFLAGS.*-O/d' Makefile || die

	if ! use static-libs; then
		sed -i \
			-e '/FILESTOINSTALL =/s/ $(LIBRARY)//' \
			-e '/$(INSTALL) -m 644 $(LIBRARY) $(INSTALLDIRLIB)/d' \
			Makefile || die
	fi
}

src_compile() {
	tc-export CC
	emake upnpc-shared $(use static-libs && echo upnpc-static)
}

src_install() {
	emake PREFIX="${D}" INSTALLDIRLIB="${D}/usr/$(get_libdir)" install
	dodoc Changelog.txt
}
