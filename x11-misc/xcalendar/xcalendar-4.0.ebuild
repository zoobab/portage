# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-misc/cvs-repo/gentoo-x86/x11-misc/xcalendar/xcalendar-4.0.ebuild,v 1.21 2010/10/10 21:04:36 ulm Exp $

EAPI=1

inherit eutils

DESCRIPTION="A simple interactive calendar program with a notebook capability"
HOMEPAGE="http://www.freebsd.org/"
SRC_URI="ftp://daemon.jp.FreeBSD.org/pub/FreeBSD-jp/ports-jp/LOCAL_PORTS/${P}+i18n.tar.gz"

SLOT="0"
LICENSE="as-is"
KEYWORDS="alpha amd64 ppc ppc64 x86 ~x86-fbsd"
IUSE="motif"

RDEPEND="x11-libs/libX11
	x11-libs/libXmu
	x11-libs/libXt
	x11-libs/libXaw
	x11-libs/libXext"
DEPEND="${RDEPEND}
	x11-misc/imake
	x11-proto/xproto
	motif? ( >=x11-libs/openmotif-2.3:0 )"

S=${WORKDIR}/${PN}

src_compile() {
	if use motif
	then
		epatch "${FILESDIR}"/${P}-motif-gentoo.diff
	fi
	xmkmf -a
	emake || die
}

src_install() {
	dobin xcalendar
	newman xcalendar.man xcalendar.1

	dodir /etc/X11/app-defaults
	sed 's;%%XCALENDAR_LIBDIR%%;/usr/lib/xcalendar;
	     s;/usr/local/X11R5/lib/X11/;/usr/lib/;' \
		< XCalendar.sed > "${D}"/etc/X11/app-defaults/XCalendar || die

	insinto /usr/lib/xcalendar
	doins *.xbm *.hlp

	dodoc README
}
