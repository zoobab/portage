# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-libs/cvs-repo/gentoo-x86/dev-libs/xmlrpc-epi/xmlrpc-epi-0.54-r1.ebuild,v 1.4 2009/10/27 10:49:17 ssuominen Exp $

EAPI="2"

inherit multilib

DESCRIPTION="Epinions implementation of XML-RPC protocol in C"
HOMEPAGE="http://xmlrpc-epi.sourceforge.net/"
SRC_URI="mirror://sourceforge/xmlrpc-epi/${P}.tar.gz"

LICENSE="Epinions"
SLOT="0"
KEYWORDS="amd64 ~ppc ~x86"
IUSE="examples static-libs"

DEPEND="dev-libs/expat"
RDEPEND="${DEPEND}"

# NOTES:
# to prevent conflict with xmlrpc-c, headers are installed in
# 	/usr/include/${PN} instead of /usr/include (bug 274291)

src_prepare() {
	# do not build examples
	sed -i -e "s:sample::" Makefile.in || die "sed failed"
}

src_configure() {
	econf \
		--includedir=/usr/include/${PN} \
		--disable-dependency-tracking \
		$(use_enable static-libs static)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	if ! use static-libs; then
		# remove useless la files
		rm "${D}"/usr/$(get_libdir)/lib${PN}.la || die "rm failed"
	fi

	dodoc AUTHORS ChangeLog NEWS README || die "dodoc failed"

	if use examples; then
		insinto "/usr/share/doc/${PF}/examples"
		doins sample/*.c sample/*.php || die "doins failed"
		doins -r sample/tests || die "doins failed"
	fi
}
