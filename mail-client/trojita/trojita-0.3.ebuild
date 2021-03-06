# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/mail-client/cvs-repo/gentoo-x86/mail-client/trojita/trojita-0.3.ebuild,v 1.1 2012/03/30 10:34:00 johu Exp $

EAPI=4

QT_REQUIRED="4.6.0"
EGIT_REPO_URI="git://gitorious.org/${PN}/${PN}.git"
[[ ${PV} == "9999" ]] && GIT_ECLASS="git-2"
inherit qt4-r2 ${GIT_ECLASS}

DESCRIPTION="A Qt IMAP e-mail client"
HOMEPAGE="http://trojita.flaska.net/"
if [[ ${PV} == "9999" ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
IUSE="debug test"

RDEPEND="
	>=x11-libs/qt-gui-${QT_REQUIRED}:4
	>=x11-libs/qt-sql-${QT_REQUIRED}:4[sqlite]
	>=x11-libs/qt-webkit-${QT_REQUIRED}:4
"
DEPEND="${RDEPEND}
	test? ( >=x11-libs/qt-test-${QT_REQUIRED}:4 )
"

src_configure() {
	eqmake4 PREFIX=/usr
}
