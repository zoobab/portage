# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-haskell/cvs-repo/gentoo-x86/dev-haskell/x11-xft/x11-xft-0.3.1.ebuild,v 1.2 2012/09/12 15:27:56 qnikst Exp $

EAPI="4"

CABAL_FEATURES="lib profile haddock"
inherit haskell-cabal

MY_PN="X11-xft"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Bindings to the Xft, X Free Type interface library, and some Xrender parts"
HOMEPAGE="http://hackage.haskell.org/cgi-bin/hackage-scripts/package/X11-xft"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.6.1
		 >=dev-haskell/utf8-string-0.1[profile?]
		 >=dev-haskell/x11-1.2.1[profile?]
		 x11-libs/libXft"

DEPEND="${RDEPEND}
		dev-haskell/cabal"

S="${WORKDIR}/${MY_P}"
