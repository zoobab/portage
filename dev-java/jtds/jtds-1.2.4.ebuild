# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-java/cvs-repo/gentoo-x86/dev-java/jtds/jtds-1.2.4.ebuild,v 1.6 2011/08/07 11:59:16 xarthisius Exp $

EAPI=2
JAVA_PKG_IUSE="doc source"

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="jTDS - SQL Server and Sybase JDBC driver"
SRC_URI="mirror://sourceforge/${PN}/${P}-src.zip"
HOMEPAGE="http://jtds.sourceforge.net"
LICENSE="LGPL-2.1"
SLOT="1.2"
KEYWORDS="amd64 x86"
COMMON_DEPEND="
	=dev-java/jcifs-1*
	dev-java/junit:0"
DEPEND=">=virtual/jdk-1.6
	${COMMON_DEPEND}
	app-arch/unzip"
RDEPEND=">=virtual/jre-1.6
	${COMMON_DEPEND}"

S=${WORKDIR}
IUSE=""

# Would need a running server
RESTRICT="test"

java_prepare() {
	epatch "${FILESDIR}/1.2.4-buildxml.patch"

	cd "${S}/lib"
	rm -v *.jar || die

	java-pkg_jar-from jcifs-1.1
	#TODO: don't always build tests
	java-pkg_jar-from junit
}

src_install() {
	java-pkg_dojar build/*.jar

	dodoc CHANGELOG README* || die "Failed to install docs."
	use doc && java-pkg_dojavadoc build/doc
	use source && java-pkg_dosrc "${S}"/src/main/*
}
