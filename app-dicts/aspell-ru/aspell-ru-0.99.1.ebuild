# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-dicts/cvs-repo/gentoo-x86/app-dicts/aspell-ru/aspell-ru-0.99.1.ebuild,v 1.21 2012/05/17 20:07:41 aballier Exp $

ASPELL_LANG="Russian"
ASPOSTFIX="6"

inherit aspell-dict

LICENSE="GPL-2"

KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd"
IUSE=""

# very strange filename not supported by the gentoo naming scheme
FILENAME=aspell6-ru-0.99f7-1

SRC_URI="mirror://gnu/aspell/dict/ru/${FILENAME}.tar.bz2"
S="${WORKDIR}/${FILENAME}"
