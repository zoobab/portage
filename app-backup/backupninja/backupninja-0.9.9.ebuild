# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-backup/cvs-repo/gentoo-x86/app-backup/backupninja/backupninja-0.9.9.ebuild,v 1.3 2011/07/26 21:14:38 maekke Exp $

EAPI=4

inherit autotools

# This thing change with every release, how idiotic...
NODE_NUMBER=230

DESCRIPTION="lightweight, extensible meta-backup system"
HOMEPAGE="http://riseuplabs.org/backupninja/"
SRC_URI="https://labs.riseup.net/code/attachments/download/${NODE_NUMBER}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-util/dialog"
RDEPEND="${DEPEND}"

DOCS=( AUTHORS FAQ TODO README NEWS )

src_prepare() {
	eautoreconf
}
