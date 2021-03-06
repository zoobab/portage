# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-java/cvs-repo/gentoo-x86/dev-java/fastutil/fastutil-4.3.1-r1.ebuild,v 1.5 2007/11/02 00:38:25 wltjr Exp $

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Provides type-specific maps, sets and lists with a small memory footprint for much faster access and insertion."
SRC_URI="http://fastutil.dsi.unimi.it/${P}-src.tar.gz"
HOMEPAGE="http://fastutil.dsi.unimi.it"
LICENSE="LGPL-2.1"
SLOT="4.3"
KEYWORDS="amd64 ppc x86"
IUSE=""

DEPEND=">=virtual/jdk-1.4"
RDEPEND=">=virtual/jre-1.4"

src_compile() {
	emake sources || die "failed to make sources"
	# bug 162650 and #175578 and #183356
	java-pkg_init-compiler_
	[[ ${GENTOO_COMPILER} != "javac" ]] && export ANT_OPTS="-Xmx512m"
	java-pkg-2_src_compile
}

src_install() {

	java-pkg_newjar ${P}.jar

	dodoc CHANGES README
	use doc && java-pkg_dojavadoc docs
	use source && java-pkg_dosrc java/it

}
