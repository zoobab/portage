# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-libs/cvs-repo/gentoo-x86/dev-libs/eeze/eeze-1.7.0.ebuild,v 1.2 2012/09/10 23:28:56 vapier Exp $

inherit enlightenment

DESCRIPTION="library to simplify the use of devices"
HOMEPAGE="http://trac.enlightenment.org/e/wiki/Eeze"
SRC_URI="http://download.enlightenment.org/releases/${P}.tar.bz2"

KEYWORDS="~amd64 ~arm ~x86"
IUSE="static-libs utilities"

DEPEND=">=dev-libs/ecore-1.7.0"
RDEPEND=${DEPEND}

src_configure() {
	MY_ECONF="
	$(use_enable utilities eeze-disk-ls)
	$(use_enable utilities eeze-mount)
	$(use_enable utilities eeze-umount)
	$(use_enable utilities eeze-udev-test)
	"

	enlightenment_src_configure
}
