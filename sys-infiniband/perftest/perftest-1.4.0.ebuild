# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-infiniband/cvs-repo/gentoo-x86/sys-infiniband/perftest/perftest-1.4.0.ebuild,v 1.2 2012/10/13 06:48:20 alexxy Exp $

EAPI="4"

OFED_VER="3.5"
OFED_RC="1"
OFED_RC_VER="2"
OFED_SUFFIX="0.80.gd1763bd"
OFED_SNAPSHOT="1"

inherit openib

DESCRIPTION="OpenIB uverbs micro-benchmarks"

KEYWORDS="~amd64 ~x86 ~amd64-linux"
IUSE=""

DEPEND="
	sys-infiniband/libibverbs:${SLOT}
	sys-infiniband/libibumad:${SLOT}
	sys-infiniband/librdmacm:${SLOT}"
RDEPEND="${DEPEND}"
block_other_ofed_versions

src_install() {
	dodoc README runme
	dobin ib_*
	dobin rdma_*
}
