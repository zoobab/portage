# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-kernel/cvs-repo/gentoo-x86/sys-kernel/vanilla-sources/vanilla-sources-2.6.16.62.ebuild,v 1.8 2012/02/21 17:53:26 mpagano Exp $

K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
ETYPE="sources"
inherit kernel-2
detect_version

DESCRIPTION="Full sources for the Linux kernel"
HOMEPAGE="http://www.kernel.org"
SRC_URI="${KERNEL_URI}"

KEYWORDS="alpha ~amd64 arm ia64 ppc ppc64 s390 sparc x86"
IUSE=""
