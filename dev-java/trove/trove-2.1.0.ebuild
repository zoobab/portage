# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-java/cvs-repo/gentoo-x86/dev-java/trove/trove-2.1.0.ebuild,v 1.4 2010/01/15 20:40:39 abcd Exp $

EAPI="2"
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="GNU Trove: High performance collections for Java."
SRC_URI="mirror://sourceforge/trove4j/${P}.tar.gz"
HOMEPAGE="http://trove4j.sourceforge.net"
LICENSE="LGPL-2.1"
IUSE=""
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
RDEPEND=">=virtual/jre-1.5"
DEPEND=">=virtual/jdk-1.5"

java_prepare() {
	rm -v lib/*.jar
	rm -fr javadocs/*
}

src_install() {
	java-pkg_newjar output/lib/*.jar
	dodoc *.txt ChangeLog AUTHORS || die
	use doc && java-pkg_dojavadoc output/javadocs
	use source && java-pkg_dosrc src/* output/gen_src/*
}
