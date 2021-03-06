# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-admin/cvs-repo/gentoo-x86/app-admin/fam/fam-2.7.0-r6.ebuild,v 1.10 2012/02/25 15:11:14 ssuominen Exp $

EAPI="2"

inherit eutils autotools

DEBIAN_PATCH="17"
DESCRIPTION="FAM, the File Alteration Monitor"
HOMEPAGE="http://oss.sgi.com/projects/fam/"
SRC_URI="ftp://oss.sgi.com/projects/fam/download/stable/${P}.tar.gz
	mirror://debian/pool/main/f/${PN}/${P/-/_}-${DEBIAN_PATCH}.diff.gz"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86"
IUSE="static-libs"

DEPEND="|| ( net-nds/rpcbind >=net-nds/portmap-5b-r6 )
	!app-admin/gamin"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${WORKDIR}/${P/-/_}-${DEBIAN_PATCH}.diff"
	edos2unix "${S}"/${P}/debian/patches/10_debianbug375967.patch
	EPATCH_SUFFIX="patch" EPATCH_FORCE="yes" epatch "${S}"/${P}/debian/patches

	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	emake install DESTDIR="${D}" || die
	if ! use static-libs; then
		rm -f "${D}"/usr/lib*/libfam.la
	fi

	sed -i "${D}"/etc/fam.conf \
		-e "s:local_only = false:local_only = true:g" \
		|| die "sed fam.conf"

	doinitd "${FILESDIR}/famd"
	dodoc AUTHORS ChangeLog INSTALL NEWS TODO README
}
