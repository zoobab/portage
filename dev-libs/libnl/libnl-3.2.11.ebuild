# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-libs/cvs-repo/gentoo-x86/dev-libs/libnl/libnl-3.2.11.ebuild,v 1.8 2012/09/29 13:33:20 blueness Exp $

EAPI=4
inherit eutils multilib

DESCRIPTION="A library for applications dealing with netlink socket"
HOMEPAGE="http://www.infradead.org/~tgr/libnl/"
SRC_URI="http://www.infradead.org/~tgr/libnl/files/${P}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="3"
KEYWORDS="~amd64 arm hppa ppc ppc64 ~s390 ~sh ~x86 ~amd64-linux ~ia64-linux ~x86-linux"
IUSE="doc static-libs utils"

DEPEND="
	sys-devel/flex
	sys-devel/bison
	doc? (
		app-text/asciidoc
		app-doc/doxygen[latex]
		media-gfx/mscgen
	)
"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.1-vlan-header.patch
}

src_configure() {
	econf $(use_enable static-libs static) $(use_enable utils cli)
}

src_compile() {
	default
	use doc && emake -C doc api_ref
}

src_install() {
	default
	if use doc; then
		dohtml doc/api/*
	fi

	if ! use static-libs; then
		rm -f "${D}"/usr/lib*/lib*.la
	fi

	dodoc ChangeLog
}
