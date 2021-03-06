# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-admin/cvs-repo/gentoo-x86/app-admin/eselect-chuck/eselect-chuck-1.0.0.ebuild,v 1.1 2009/08/09 11:34:14 cedk Exp $

DESCRIPTION="Manages the /usr/bin/chuck symlink"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI="mirror://gentoo/chuck.eselect-${PVR}.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=app-admin/eselect-1.0.6"
DEPEND="!<=media-sound/chuck-1.2.1.2"

src_install() {
	insinto /usr/share/eselect/modules
	newins "${WORKDIR}/chuck.eselect-${PVR}" chuck.eselect || die
}
