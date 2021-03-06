# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-misc/cvs-repo/gentoo-x86/kde-misc/kfilebox/kfilebox-0.4.9.ebuild,v 1.1 2012/05/03 07:37:36 johu Exp $

EAPI=4

LANGS="ar br cs de el es fr gl it lt nl pl pt ru si tr zh"
inherit qt4-r2

MY_P="${PN}_${PV}"

DESCRIPTION="KDE dropbox client"
HOMEPAGE="http://kdropbox.deuteros.es/"
SRC_URI="http://dev.gentoo.org/~tampakrap/tarballs/${MY_P}.tar.gz"
LICENSE="GPL-2"

SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE=""

for name in ${LANGS} ; do IUSE+="linguas_$name " ; done
unset name

DEPEND="kde-base/kdelibs"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_install() {
	qt4-r2_src_install

	for lang in ${LANGS}; do
		if ! has ${lang} ${LINGUAS}; then
			rm -rf "${D}"/usr/share/locale/${lang} || die
		fi
	done
}
