# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-haskell/cvs-repo/gentoo-x86/dev-haskell/wxdirect/wxdirect-0.12.1.3.ebuild,v 1.3 2012/09/12 15:56:43 qnikst Exp $

CABAL_FEATURES="bin lib profile haddock"
inherit haskell-cabal

DESCRIPTION="helper tool for building wxHaskell"
HOMEPAGE="http://haskell.org/haskellwiki/WxHaskell"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND=">=dev-haskell/parsec-2.1.0
		>=dev-haskell/time-1.0
		>=dev-lang/ghc-6.10"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.2"
