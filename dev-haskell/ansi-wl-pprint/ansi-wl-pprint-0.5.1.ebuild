# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-haskell/cvs-repo/gentoo-x86/dev-haskell/ansi-wl-pprint/ansi-wl-pprint-0.5.1.ebuild,v 1.10 2012/09/12 15:27:09 qnikst Exp $

CABAL_FEATURES="bin lib profile haddock"
inherit haskell-cabal

DESCRIPTION="The Wadler/Leijen Pretty Printer for colored ANSI terminal output"
HOMEPAGE="http://github.com/batterseapower/ansi-wl-pprint"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.6.1
		 >=dev-haskell/ansi-terminal-0.4.0"
DEPEND=">=dev-haskell/cabal-1.2
		${RDEPEND}"
