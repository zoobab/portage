# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-ml/cvs-repo/gentoo-x86/dev-ml/lwt/lwt-2.4.0.ebuild,v 1.1 2012/07/19 23:23:54 aballier Exp $

EAPI=4

OASIS_BUILD_TESTS=1
OASIS_BUILD_DOCS=1

inherit oasis

DESCRIPTION="Cooperative light-weight thread library for OCaml"
SRC_URI="http://ocsigen.org/download/${P}.tar.gz"
HOMEPAGE="http://ocsigen.org/lwt"

IUSE="gtk +react +ssl"

DEPEND="react? ( dev-ml/react )
	dev-libs/libev
	ssl? ( >=dev-ml/ocaml-ssl-0.4.0 )
	gtk? ( dev-ml/lablgtk dev-libs/glib:2 )"

RDEPEND="${DEPEND}
	!<www-servers/ocsigen-1.1"

SLOT="0"
LICENSE="LGPL-2.1-with-linking-exception"
KEYWORDS="~amd64 ~x86 ~x86-fbsd"

DOCS=( "CHANGES" "CHANGES.darcs" "README" )

src_configure() {
	oasis_configure_opts="$(use_enable gtk glib)
		$(use_enable react)
		$(use_enable ssl)" \
		oasis_src_configure
}
