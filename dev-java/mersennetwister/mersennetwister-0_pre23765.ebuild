# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-java/cvs-repo/gentoo-x86/dev-java/mersennetwister/mersennetwister-0_pre23765.ebuild,v 1.3 2009/03/09 22:37:32 maekke Exp $

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Modified MersenneTwister java port for Freenet"
HOMEPAGE="http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/emt.html"
SRC_URI="mirror://gentoo/${P}.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 x86"

IUSE=""

RDEPEND=">=virtual/jre-1.5"
DEPEND=">=virtual/jdk-1.5"

S=${WORKDIR}

src_install() {
	java-pkg_dojar "${PN}.jar"
	use doc && java-pkg_dojavadoc docs
	use source && java-pkg_dosrc org
}
