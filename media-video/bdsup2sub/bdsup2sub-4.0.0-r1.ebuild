# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-video/cvs-repo/gentoo-x86/media-video/bdsup2sub/bdsup2sub-4.0.0-r1.ebuild,v 1.2 2010/08/14 02:57:57 sbriesen Exp $

EAPI="3"

JAVA_PKG_IUSE="doc source"

inherit eutils java-pkg-2 java-ant-2

XDG_P="xdg-20100731"

DESCRIPTION="A tool to convert and tweak bitmap based subtitle streams"
HOMEPAGE="http://bdsup2sub.javaforge.com/help.htm"
SRC_URI="http://sbriesen.de/gentoo/distfiles/${P}.tar.xz
	http://sbriesen.de/gentoo/distfiles/${XDG_P}.java.xz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/jre-1.6"
DEPEND=">=virtual/jdk-1.6
	app-arch/xz-utils"

S="${WORKDIR}/${PN}/${PV}"

java_prepare() {
	# apply XDG patch
	cp -f "${WORKDIR}/${XDG_P}.java" "${S}/src/xdg.java"
	epatch "${FILESDIR}/${P}-xdg.patch"

	# copy build.xml
	cp -f "${FILESDIR}/build-${PV}.xml" build.xml || die
}

src_compile() {
	eant build $(use_doc)
}

src_install() {
	java-pkg_dojar dist/BDSup2Sub.jar
	java-pkg_dolauncher BDSup2Sub --main BDSup2Sub --java_args -Xmx256m
	newicon bin_copy/icon_32.png BDSup2Sub.png
	make_desktop_entry BDSup2Sub BDSup2Sub BDSup2Sub
	use doc && java-pkg_dojavadoc apidocs
	use source && java-pkg_dosrc src
}
