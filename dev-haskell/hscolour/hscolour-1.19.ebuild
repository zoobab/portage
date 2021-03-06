# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-haskell/cvs-repo/gentoo-x86/dev-haskell/hscolour/hscolour-1.19.ebuild,v 1.6 2012/09/12 16:01:51 qnikst Exp $

EAPI="3"

CABAL_FEATURES="bin lib profile haddock"
inherit base haskell-cabal

DESCRIPTION="Colourise Haskell code."
HOMEPAGE="http://code.haskell.org/~malcolm/hscolour/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.6.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"

src_install() {
	cabal_src_install
	if use doc; then
		dohtml hscolour.css
	fi
}
