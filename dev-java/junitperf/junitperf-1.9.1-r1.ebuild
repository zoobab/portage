# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-java/cvs-repo/gentoo-x86/dev-java/junitperf/junitperf-1.9.1-r1.ebuild,v 1.17 2012/04/15 18:47:02 vapier Exp $

JAVA_PKG_IUSE="doc test source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Simple framework to write repeatable tests"
SRC_URI="http://www.clarkware.com/software/${P}.zip"
HOMEPAGE="http://www.clarkware.com/software/JUnitPerf.html"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~ia64 ppc ppc64 x86 ~x86-fbsd ~amd64-linux ~x86-linux ~x86-macos"

IUSE=""

COMMON_DEP="=dev-java/junit-3.8*"

RDEPEND=">=virtual/jre-1.4
	${COMMON_DEP}"

DEPEND=">=virtual/jdk-1.4
	app-arch/unzip
	test? ( dev-java/ant-junit )
	${COMMON_DEP}"

src_unpack () {
	unpack ${A}
	cd "${S}"/lib || die
	rm -fv *.jar || die
	java-pkg_jar-from junit
}

EANT_DOC_TARGET=""

src_test() {
	ANT_TASKS="ant-junit" eant test
}

src_install() {
	java-pkg_dojar lib/${PN}.jar
	dodoc README || die
	use doc && java-pkg_dojavadoc docs/api
	use source && java-pkg_dosrc src/app/*
}
