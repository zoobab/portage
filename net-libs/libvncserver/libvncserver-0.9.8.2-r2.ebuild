# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-libs/cvs-repo/gentoo-x86/net-libs/libvncserver/libvncserver-0.9.8.2-r2.ebuild,v 1.11 2012/07/08 16:06:05 armin76 Exp $

EAPI="4"

inherit eutils libtool

DESCRIPTION="library for creating vnc servers"
HOMEPAGE="http://libvncserver.sourceforge.net/"
SRC_URI="http://libvncserver.sourceforge.net/LibVNCServer-${PV/_}.tar.gz
	mirror://sourceforge/libvncserver/LibVNCServer-${PV/_}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 sh sparc x86 ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="+24bpp gcrypt gnutls ipv6 +jpeg test threads +zlib"

DEPEND="gcrypt? ( dev-libs/libgcrypt )
	gnutls? ( net-libs/gnutls )
	jpeg? ( virtual/jpeg )
	zlib? ( sys-libs/zlib )"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/LibVNCServer-${PV/_}

src_prepare() {
	sed -i -r \
		-e '/^CFLAGS =/d' \
		-e "/^SUBDIRS/s:\<($(use test || echo 'test|')client_examples|examples)\>::g" \
		Makefile.in || die

	# Bug 329031.
	epatch "${FILESDIR}/${PN}-memcpy.patch"

	elibtoolize
}

src_configure() {
	econf \
		--without-x11vnc \
		$(use_with 24bpp) \
		$(use_with gcrypt) \
		$(use_with gnutls) \
		$(use_with ipv6) \
		$(use_with jpeg) \
		$(use_with threads pthread) \
		$(use_with zlib)
}

src_compile() {
	default
	emake -C examples noinst_PROGRAMS=storepasswd
}

src_install() {
	emake install DESTDIR="${D}"
	dodoc AUTHORS ChangeLog NEWS README TODO
}
