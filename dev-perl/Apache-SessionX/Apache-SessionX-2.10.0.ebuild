# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-perl/cvs-repo/gentoo-x86/dev-perl/Apache-SessionX/Apache-SessionX-2.10.0.ebuild,v 1.3 2012/03/19 19:20:49 armin76 Exp $

EAPI=4

MODULE_AUTHOR=GRICHTER
MODULE_VERSION=2.01
inherit perl-module

DESCRIPTION="An extented persistence framework for session data"

SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE=""

RDEPEND="dev-perl/Apache-Session"
DEPEND="${RDEPEND}"

src_compile() {
	echo "n" | perl-module_src_compile
}
