# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-java/cvs-repo/gentoo-x86/dev-java/matrix-toolkits-java/matrix-toolkits-java-0.9.12.ebuild,v 1.1 2009/09/21 04:57:20 weaver Exp $

EAPI="2"

JAVA_PKG_IUSE="doc test"
#WANT_ANT_TASKS="ant-junit"
EANT_GENTOO_CLASSPATH="junit"
JAVA_ANT_REWRITE_CLASSPATH="true"

inherit java-pkg-2 java-ant-2

DESCRIPTION="BLAS and LAPACK-derived matrix data structures and linear algebra methods"
HOMEPAGE="http://code.google.com/p/matrix-toolkits-java/"
SRC_URI="http://matrix-toolkits-java.googlecode.com/files/mtj-${PV}.zip"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEPS=""
DEPEND=">=virtual/jdk-1.5
	${COMMON_DEPS}"
RDEPEND=">=virtual/jre-1.5
	${COMMON_DEPS}"

S="${WORKDIR}/mtj-${PV}"

src_prepare() {
	einfo "Removing bundled jars..."
	cd "${S}/lib/junit"
	rm -v junit*.jar
	java-pkg_jar-from junit
	cd "${S}"
	rm -v mtj*.jar
	java-pkg-2_src_prepare
}

src_compile() {
	eant jar -Dplatforms.JDK_1.5.home="${JAVA_HOME}"
}

src_install() {
	java-pkg_newjar dist/Matrix_Toolkits_for_Java.jar ${PN}.jar
	use doc && java-pkg_dojavadoc javadoc
}

# FIXME: Test suite compilation fails
#src_test() {
#	eant test -Dplatforms.JDK_1.5.home="${JAVA_HOME}"
#}
