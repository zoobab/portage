# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-text/cvs-repo/gentoo-x86/app-text/skribe/skribe-1.2l.ebuild,v 1.3 2010/09/15 21:47:28 chiiph Exp $

EAPI="3"

inherit multilib

MY_P="${PN}${PV}"

DESCRIPTION="Skribe is a text processor for technical documents written in scheme."
HOMEPAGE="http://www-sop.inria.fr/mimosa/fp/Skribe/"
SRC_URI="ftp://ftp-sop.inria.fr/mimosa/fp/Skribe/${MY_P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-scheme/bigloo"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	# falsify bigloo auto-strip feature to prevent pre-stripped QA errors
	sed -r 's/^blinkflags="(.*)"$/blinkflags="\1 -eval '\''(set! *strip* \\#f)'\''"/gi' \
		-i ./etc/bigloo/configure || die "sed failed"
}

src_configure() {
	./configure \
		--with-bigloo \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--libdir=/usr/$(get_libdir) \
		--docdir=/usr/share/doc/${PF} || die "configure failed"
}

src_compile() {
	emake -j1 || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
