# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-themes/cvs-repo/gentoo-x86/x11-themes/human-icon-theme/human-icon-theme-0.36.ebuild,v 1.2 2012/05/07 08:49:52 ssuominen Exp $

EAPI=4
inherit gnome2-utils

DESCRIPTION="A nice and well polished icon theme"
HOMEPAGE="http://packages.ubuntu.com/lucid/human-icon-theme"
SRC_URI="mirror://ubuntu/pool/universe/h/${PN}/${PN}_${PV}.tar.gz
	http://www.gentoo.org/images/gentoo-logo.svg"

LICENSE="CCPL-Attribution-ShareAlike-2.5"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="binchecks strip"

RDEPEND="|| ( x11-themes/tangerine-icon-theme x11-themes/gnome-icon-theme )"
DEPEND=">=gnome-base/librsvg-2.34
	>=x11-misc/icon-naming-utils-0.8.90
	dev-util/intltool
	sys-devel/gettext"

S=${WORKDIR}/${PN}

DOCS="AUTHORS"

src_prepare() {
	sed -i -e 's:lib/icon-naming-utils/icon:libexec/icon:' Makefile || die
	sed -i -e '/SVGCONVERT/s:rsvg:&-convert:' svg2png.sh.in || die #414971

	cp "${DISTDIR}"/gentoo-logo.svg scalable/places/start-here.svg || die

	local res
	for res in 22 32 48; do
		rsvg-convert -w ${res} -h ${res} scalable/places/start-here.svg \
			> ${res}x${res}/places/start-here.png || die
	done
}

src_compile() {
	emake index.theme
}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
