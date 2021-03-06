# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-cluster/cvs-repo/gentoo-x86/sys-cluster/maui/maui-3.2.6_p16.ebuild,v 1.6 2011/09/06 08:23:37 jlec Exp $

inherit autotools eutils multilib

DESCRIPTION="Maui Cluster Scheduler"
HOMEPAGE="http://www.clusterresources.com/pages/products/maui-cluster-scheduler.php"
SRC_URI="http://www.clusterresources.com/downloads/maui/${P/_/}.tar.gz"
IUSE=""
DEPEND="sys-cluster/torque"
RDEPEND="${DEPEND}"
SLOT="0"
LICENSE="maui"
KEYWORDS="~x86 ~amd64"
RESTRICT="fetch mirror"

S="${WORKDIR}/${P/_/}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${PV}-set-pbs-cflags-ldflags.patch
	epatch "${FILESDIR}"/${PV}-autoconf-2.60-compat.patch
	epatch "${FILESDIR}"/${PV}-link-pbs-after-moab.patch
	sed -i \
		-e "s~BUILDROOT=~BUILDROOT=${D}~" \
		"${S}"/Makefile.in
	eautoreconf
}

src_compile() {
	econf \
		--with-spooldir=/usr/spool/maui \
		--with-pbs=/usr/$(get_libdir)/pbs \
		|| die "econf failed!"
	emake || die "emake failed!"
}

src_install() {
	make install INST_DIR="${D}"/usr

	cd docs
	dodoc README mauidocs.html
}
