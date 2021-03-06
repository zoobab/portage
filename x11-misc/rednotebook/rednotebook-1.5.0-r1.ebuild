# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-misc/cvs-repo/gentoo-x86/x11-misc/rednotebook/rednotebook-1.5.0-r1.ebuild,v 1.1 2012/07/30 08:07:55 mattm Exp $

EAPI="3"

PYTHON_DEPEND="2:2.6"

inherit python eutils distutils

DESCRIPTION="A graphical journal with calendar, templates, tags, keyword searching, and export functionality"
HOMEPAGE="http://rednotebook.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libyaml spell"

RDEPEND="dev-python/pyyaml[libyaml?]
	>=dev-python/pygtk-2.13
	>=dev-python/pywebkitgtk-1.1.5
	dev-python/chardet
	spell? ( dev-python/gtkspell-python )"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	! use spell && epatch "${FILESDIR}/${PN}-1.2.0-disable-spell.patch"
	distutils_src_prepare
}
