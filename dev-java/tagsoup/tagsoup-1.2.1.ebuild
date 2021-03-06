# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-java/cvs-repo/gentoo-x86/dev-java/tagsoup/tagsoup-1.2.1.ebuild,v 1.5 2012/10/10 21:34:04 naota Exp $

EAPI=4

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="A SAX-compliant parser written in Java."
HOMEPAGE="http://mercury.ccil.org/~cowan/XML/tagsoup/"
SRC_URI="http://mercury.ccil.org/~cowan/XML/tagsoup/${P}-src.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~x86-macos"
IUSE=""

RDEPEND="
	>=virtual/jre-1.4"
DEPEND="
	>=virtual/jdk-1.4
	dev-java/saxon:9
	app-arch/unzip"

EANT_BUILD_TARGET="dist"
EANT_DOC_TARGET="docs-api"
# Fails to detect a TransformerFactory. #421733
# See also https://issues.apache.org/jira/browse/XALANJ-1549 for why the default is no good either.
EANT_ANT_TASKS="saxon-9"
EANT_EXTRA_ARGS="-Dtransformer.factory=net.sf.saxon.TransformerFactoryImpl"

src_install() {
	java-pkg_newjar dist/lib/${PN}-1.2.jar ${PN}.jar
	java-pkg_dolauncher

	doman ${PN}.1 || die
	dodoc CHANGES README TODO || die

	use doc && java-pkg_dojavadoc docs/api
	use source && java-pkg_dosrc src/{java,templates}/*
}
