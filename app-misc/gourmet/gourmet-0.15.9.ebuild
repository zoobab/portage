# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-misc/cvs-repo/gentoo-x86/app-misc/gourmet/gourmet-0.15.9.ebuild,v 1.4 2011/07/14 12:46:02 pacho Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython"

inherit distutils

DESCRIPTION="Recipe Organizer and Shopping List Generator for Gnome"
HOMEPAGE="http://grecipe-manager.sourceforge.net/"
SRC_URI="mirror://sourceforge/grecipe-manager/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="gnome-print pdf rtf"

RDEPEND=">=dev-python/pygtk-2.3.93:2
	dev-python/pygobject:2
	>=dev-python/libgnome-python-2
	>=gnome-base/libglade-2
	|| ( =dev-lang/python-2*[sqlite] dev-python/pysqlite:2 )
	dev-python/sqlalchemy
	!=dev-python/sqlalchemy-0.6.4
	dev-python/imaging
	dev-python/gtkspell-python
	dev-db/metakit[python]
	pdf? ( dev-python/reportlab dev-python/python-poppler )
	rtf? ( dev-python/pyrtf )
	gnome-print? ( dev-python/libgnomeprint-python
	               dev-python/python-poppler )"
DEPEND="${RDEPEND}"

# distutils gets a bunch of default docs
DOCS="TESTS FAQ"

src_prepare() {
	distutils_src_prepare
	python_convert_shebangs -r --quiet 2 .
}

src_install() {
	distutils_src_install --disable-modules-check
	doman gourmet.1
}
