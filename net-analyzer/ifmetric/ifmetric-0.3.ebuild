# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-analyzer/cvs-repo/gentoo-x86/net-analyzer/ifmetric/ifmetric-0.3.ebuild,v 1.4 2005/09/11 22:57:23 metalgod Exp $

DESCRIPTION="A Linux tool for setting the metrics of all IPv4 routes attached to a given network interface at once."
HOMEPAGE="http://0pointer.de/lennart/projects/ifmetric/"
SRC_URI="http://0pointer.de/lennart/projects/ifmetric/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc x86"
IUSE=""

# NOTE: this app is linux-only, virtual/os-headers therefore is incorrect
DEPEND="sys-kernel/linux-headers"
RDEPEND=""

src_compile() {
	# man page and HTML are already generated
	econf --disable-xmltoman --disable-lynx || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc README
	dohtml doc/README.html
}
