# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-vcs/cvs-repo/gentoo-x86/dev-vcs/git-annex/git-annex-3.20111203.ebuild,v 1.3 2012/09/12 16:08:45 qnikst Exp $

# ebuild generated by hackport 0.2.13

EAPI="3"

CABAL_FEATURES="bin"
inherit haskell-cabal

DESCRIPTION="manage files with git, without checking their contents into git"
HOMEPAGE="http://git-annex.branchable.com/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-vcs/git-1.7.7" # TODO: add more deps?
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6
		dev-haskell/dataenc
		dev-haskell/hs3
		dev-haskell/hslogger
		dev-haskell/http
		dev-haskell/json
		dev-haskell/missingh
		dev-haskell/monad-control
		>=dev-haskell/mtl-2
		dev-haskell/network
		dev-haskell/pcre-light
		dev-haskell/sha
		dev-haskell/time
		dev-haskell/utf8-string
		>=dev-lang/ghc-6.10.1"
