# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-fonts/cvs-repo/gentoo-x86/media-fonts/wqy-unibit/wqy-unibit-1.1.0_p1.ebuild,v 1.2 2009/09/11 21:44:49 maekke Exp $

inherit font

MY_P="${PN}-bdf-${PV/_p/-}"
DESCRIPTION="WenQuanYi Unibit CJK font"
HOMEPAGE="http://wenq.org/enindex.cgi"
SRC_URI="mirror://sourceforge/wqy/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="media-gfx/ebdftopcf"
RDEPEND=""

S="${WORKDIR}/${PN}"
FONT_S="${S}"
FONT_SUFFIX="pcf.gz"
DOCS="AUTHORS ChangeLog README"

# Only installs fonts
RESTRICT="strip binchecks"

src_compile() {
	emake || die
	gzip -9 wqy-unibit.pcf || die
}
