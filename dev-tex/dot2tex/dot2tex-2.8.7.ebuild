# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-tex/cvs-repo/gentoo-x86/dev-tex/dot2tex/dot2tex-2.8.7.ebuild,v 1.19 2012/04/22 18:29:23 grobian Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A Graphviz to LaTeX converter"
HOMEPAGE="http://www.fauskes.net/code/dot2tex/"
SRC_URI="http://dot2tex.googlecode.com/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd ~amd64-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris"
IUSE="doc examples"

DEPEND=""
RDEPEND=">=dev-python/pyparsing-1.4.8
	media-gfx/pydot
	media-gfx/graphviz"

DOCS="changelog.txt"

src_install() {
	distutils_src_install
	if use doc; then
		dohtml -r doc/*
		dodoc doc/usage.{txt,pdf}
	fi
	if use examples; then
		insinto "/usr/share/doc/${PF}/examples"
		doins examples/*
	fi
}
