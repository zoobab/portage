# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-sound/cvs-repo/gentoo-x86/media-sound/saydate/saydate-0.3.0.ebuild,v 1.16 2009/08/03 13:11:44 ssuominen Exp $

S=${WORKDIR}/${PN}
DESCRIPTION="A Linux shell program that talks the date and system uptime."
HOMEPAGE="http://unihedron.com/projects/saydate/saydate.php"
SRC_URI="http://unihedron.com/projects/saydate/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"

KEYWORDS="amd64 ~ppc ppc64 sparc x86"

DEPEND="=sys-apps/sed-4*"
IUSE=""

# Don't leave this empty or it tries to install directly
# on livefs
src_compile() { :; }

src_install () {
	insinto /usr/share/man/man1
	doins "${S}"/man/saydate.1.gz "${S}"/man/au2raw.1.gz

	dodir /usr/share/saydate
	insinto /usr/share/saydate
	doins "${S}"/data/*.raw

	sed -i "s:/dev/audio:/dev/dsp:" "${S}"/saydate
	sed -i "s:/dev/audio:/dev/dsp:" "${S}"/au2raw
	sed -i "s:/dev/audio:/dev/dsp:" "${S}"/DESIGN
	dodoc README TODO HISTORY DESIGN
	dobin saydate au2raw || die "dobin failed"
}
