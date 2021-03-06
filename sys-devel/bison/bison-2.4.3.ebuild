# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-devel/cvs-repo/gentoo-x86/sys-devel/bison/bison-2.4.3.ebuild,v 1.11 2012/09/07 20:08:49 vapier Exp $

EAPI="2"

inherit flag-o-matic eutils

DESCRIPTION="A yacc-compatible parser generator"
HOMEPAGE="http://www.gnu.org/software/bison/bison.html"
SRC_URI="mirror://gnu/bison/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~sparc-fbsd ~x86-fbsd"
IUSE="nls static"

RDEPEND="sys-devel/m4"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )"

src_prepare() {
	epatch "${FILESDIR}"/${P}-uclibc-sched_param-def.patch
	epatch "${FILESDIR}"/${P}-no-gets.patch
}

src_configure() {
	use static && append-ldflags -static
	econf $(use_enable nls)
}

src_install() {
	emake DESTDIR="${D}" install || die

	# This one is installed by dev-util/yacc
	mv "${D}"/usr/bin/yacc{,.bison} || die
	mv "${D}"/usr/share/man/man1/yacc{,.bison}.1 || die

	# We do not need this.
	rm -r "${D}"/usr/lib* || die

	dodoc AUTHORS NEWS ChangeLog README OChangeLog THANKS TODO
}

pkg_postinst() {
	if [[ ! -e ${ROOT}/usr/bin/yacc ]] ; then
		ln -s yacc.bison "${ROOT}"/usr/bin/yacc
	fi
}
