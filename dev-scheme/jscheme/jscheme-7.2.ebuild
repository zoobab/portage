# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-scheme/cvs-repo/gentoo-x86/dev-scheme/jscheme/jscheme-7.2.ebuild,v 1.1 2010/07/02 00:51:06 chiiph Exp $

EAPI="3"

inherit java-utils-2 java-pkg-2

DESCRIPTION="JScheme is a dialect of Scheme with a very simple interface to Java, called the Javadot notation"
HOMEPAGE="http://jscheme.sourceforge.net/jscheme/main.html"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"

LICENSE="Apache-1.1"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

DEPEND=">=virtual/jdk-1.6"
RDEPEND=">=virtual/jre-1.6
	${DEPEND}"

src_compile() {
	sh bin/make || die "make failed"
}

src_install() {
	java-pkg_dojar lib/*.jar

	java-pkg_dolauncher ${PN} \
		--main jscheme.REPL

	if use doc; then
		dohtml -r doc || die "dohtml failed"
	fi
}
