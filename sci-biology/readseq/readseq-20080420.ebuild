# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sci-biology/cvs-repo/gentoo-x86/sci-biology/readseq/readseq-20080420.ebuild,v 1.3 2008/07/16 17:00:20 armin76 Exp $

EAPI=1

inherit java-pkg-2 java-ant-2

MY_P="${PN}-source-${PV}"
DESCRIPTION="Reads and writes nucleic/protein sequences in various formats."
HOMEPAGE="http://iubio.bio.indiana.edu/soft/molbio/readseq/"
# Originally unversioned at
# http://iubio.bio.indiana.edu/soft/molbio/readseq/java/readseq-source.zip.
# Renamed to the date of the modification and mirrored
SRC_URI="http://dev.gentoo.org/~dberkholz/distfiles/${MY_P}.zip"
#SRC_URI="mirror://gentoo/${MY_P}.zip"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
COMMON="dev-java/xerces:2
	dev-java/jaxp"
RDEPEND="${COMMON}
	>=virtual/jre-1.4"
DEPEND="${COMMON}
	>=virtual/jdk-1.4
	app-arch/unzip"
S=${WORKDIR}

src_unpack() {
	unpack ${A}
	cd "${S}"
	java-pkg_jar-from xerces-2 xercesImpl.jar lib/ibm-xml4j-min.jar
	java-pkg_jar-from jaxp jaxp-ri.jar lib/orgxml.jar
}

src_install() {
	java-pkg_dojar build/readseq.jar

	java-pkg_dolauncher
}

pkg_postinst() {
	elog "Documentation is available at"
	elog "http://iubio.bio.indiana.edu/soft/molbio/readseq/java/Readseq2-help.html"
}
