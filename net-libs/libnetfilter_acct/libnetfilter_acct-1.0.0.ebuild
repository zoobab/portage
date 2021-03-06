# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-libs/cvs-repo/gentoo-x86/net-libs/libnetfilter_acct/libnetfilter_acct-1.0.0.ebuild,v 1.3 2012/09/02 10:32:11 pinkbyte Exp $

EAPI=4

inherit eutils multilib

DESCRIPTION="Userspace library providing interface to extended accounting infrastructure of NetFilter"
HOMEPAGE="http://netfilter.org/projects/libnetfilter_acct"
SRC_URI="http://www.netfilter.org/projects/${PN}/files/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="net-libs/libmnl"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	econf \
		--libdir="${EPREFIX}"/$(get_libdir)
}

src_install() {
	emake DESTDIR="${D}" install
	dodir /usr/$(get_libdir)/pkgconfig/
	mv "${ED}"/{,usr/}$(get_libdir)/pkgconfig/${PN}.pc || die
	dodoc README

	if use examples; then
		find examples/ -name "Makefile*" -exec rm -f '{}' +
		dodoc -r examples/
		docompress -x /usr/share/doc/${P}/examples
	fi

	prune_libtool_files
}
