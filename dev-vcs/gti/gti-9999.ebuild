# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-vcs/cvs-repo/gentoo-x86/dev-vcs/gti/gti-9999.ebuild,v 1.1 2012/08/16 11:44:55 scarabeus Exp $

EAPI=4

EGIT_REPO_URI="git://github.com/rwos/${PN}.git"
inherit git-2

DESCRIPTION="A silly git launcher, basically. Inspired by sl"
HOMEPAGE="http://r-wos.org/hacks/gti"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
[[ ${PV} == 9999 ]] || KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND="dev-vcs/git"
RDEPEND="${DEPEND}"

src_prepare() {
	# fix the makefile
	sed -i \
		-e "s:CC=:CC?=:g" \
		-e "s:CFLAGS=:CFLAGS?=:g" \
		-e "/-strip/d" \
		-e 's:$(CC):$(CC) $(LDFLAGS):' \
		Makefile
}

src_install() {
	dobin gti
}
