# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-emulation/cvs-repo/gentoo-x86/app-emulation/simh/simh-3.3.0.ebuild,v 1.3 2007/07/12 06:39:56 mr_bones_ Exp $

inherit eutils versionator

MY_P="${PN}v$(get_version_component_range 1)$(get_version_component_range 2)-$(get_version_component_range 3)"
DESCRIPTION="a simulator for historical computers such as Vax, PDP-11 etc.)"
HOMEPAGE="http://simh.trailing-edge.com/"
SRC_URI="http://simh.trailing-edge.com/sources/${MY_P}.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="x86"

RDEPEND="net-libs/libpcap"
DEPEND="${RDEPEND}
	app-arch/unzip"

S="${WORKDIR}"

MAKEOPTS="USE_NETWORK=1 ${MAKEOPTS}"

src_unpack() {
	mkdir "${WORKDIR}/BIN"
	unpack ${A}

	# convert makefile from dos format to unix format
	sed -i 's/.$//' makefile

	epatch "${FILESDIR}/makefile.patch"
}

src_compile() {
	emake || die "make failed"
}

src_install() {
	cd "${S}/BIN"
	for BINFILE in *; do
		newbin ${BINFILE} "simh-${BINFILE}"
	done

	cd ${S}
	dodir /usr/share/simh
	insinto /usr/share/simh
	doins VAX/*.bin
	dodoc *.txt */*.txt
}
