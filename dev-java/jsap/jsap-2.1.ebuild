# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-java/cvs-repo/gentoo-x86/dev-java/jsap/jsap-2.1.ebuild,v 1.8 2010/04/24 15:29:43 grobian Exp $

JAVA_PKG_IUSE="doc source"
inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Java Simple Arguments Parser (JSAP)"
HOMEPAGE="http://sourceforge.net/projects/jsap"
MY_PN=JSAP
MY_P=${MY_PN}-${PV}
SRC_URI="mirror://sourceforge/${PN}/${MY_P}-src.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86 ~amd64-linux ~x86-linux ~sparc-solaris ~x86-solaris"
IUSE="test"

COMMON_DEP="
	>=dev-java/ant-core-1.7.0
	dev-java/xstream"

DEPEND=">=virtual/jdk-1.4
	${COMMON_DEP}
	=dev-java/snip-0.11*
	=dev-java/rundoc-0.11*
	test? (
		dev-java/ant-junit
		=dev-java/junit-3.8*
	)"

RDEPEND=">=virtual/jre-1.4
	${COMMON_DEP}"

S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-build.xml.patch"
	java-ant_rewrite-classpath
	cd "${S}/lib"

	rm -v *.jar
}

EANT_BUILD_TARGET="jar"
EANT_JAVADOC_TARGET="javadoc"
EANT_ANT_TASKS="rundoc snip"
EANT_GENTOO_CLASSPATH="ant-core xstream"

src_test() {
	ANT_TASKS="ant-junit rundoc snip" eant test
}

src_install() {
	java-pkg_newjar dist/${MY_P}.jar

	if use doc; then
		dohtml doc/*.html
		java-pkg_dojavadoc doc/javadoc
		dosym /usr/share/doc/${PF}/html/api /usr/share/doc/${PF}/html/javadoc
	fi

	use source && java-pkg_dosrc src/java/com
}
