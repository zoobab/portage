# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-libs/cvs-repo/gentoo-x86/dev-libs/libIDL/libIDL-0.8.14.ebuild,v 1.11 2012/05/09 01:28:14 aballier Exp $

GNOME2_LA_PUNT="yes"

inherit eutils gnome2

DESCRIPTION="CORBA tree builder"
HOMEPAGE="http://www.gnome.org/"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sh sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND=">=dev-libs/glib-2.4"
DEPEND="${RDEPEND}
	sys-devel/flex
	virtual/yacc
	virtual/pkgconfig"

DOCS="AUTHORS BUGS ChangeLog HACKING MAINTAINERS NEWS README"
G2CONF="--disable-static"

src_unpack() {
	gnome2_src_unpack
	epunt_cxx
}
