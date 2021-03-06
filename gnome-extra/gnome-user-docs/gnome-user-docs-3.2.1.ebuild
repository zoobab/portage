# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/gnome-extra/cvs-repo/gentoo-x86/gnome-extra/gnome-user-docs/gnome-user-docs-3.2.1.ebuild,v 1.1 2011/11/04 06:21:46 tetromino Exp $

EAPI="4"
GCONF_DEBUG="no"

inherit gnome2

DESCRIPTION="GNOME end user documentation"
HOMEPAGE="http://www.gnome.org/"

LICENSE="CCPL-Attribution-3.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="test"

# Newer gnome-doc-utils is needed for RNGs
# libxml2 needed for xmllint
# scrollkeeper is referenced in gnome-user-docs.spec, but is not used
RDEPEND=""
DEPEND="test? (
		>=app-text/gnome-doc-utils-0.20.5
		dev-libs/libxml2 )"
# eautoreconf requires:
#	app-text/yelp-tools
# rebuilding translations requires:
#	dev-libs/libxml2
#	dev-util/gettext
#	dev-util/itstool

# This ebuild does not install any binaries
RESTRICT="binchecks strip"

DOCS="AUTHORS ChangeLog NEWS README"

pkg_setup() {
	# itstool is only needed for rebuilding translations
	G2CONF="${G2CONF} ITSTOOL=$(type -P true)"
	# xmllint is only needed for tests
	use test || G2CONF="${G2CONF} XMLLINT=$(type -P true)"
}

src_compile() {
	# Do not compile; "make all" with unset LINGUAS rebuilds all translations,
	# which can take > 2 hours on a Core i7.
	return
}
