# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-embedded/cvs-repo/gentoo-x86/dev-embedded/include/include-0.3.2.ebuild,v 1.12 2012/08/28 07:07:48 radhermit Exp $

DESCRIPTION="A collection of useful, independent include files for C/Assembler developers."
HOMEPAGE="http://openwince.sourceforge.net/include/"
SRC_URI="mirror://sourceforge/openwince/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="ppc sparc x86"
IUSE=""

DEPEND="sys-apps/grep
	sys-apps/gawk"
RDEPEND=""

src_install() {
	emake DESTDIR="${D}" install
}
