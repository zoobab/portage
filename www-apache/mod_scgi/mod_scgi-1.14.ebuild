# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/www-apache/cvs-repo/gentoo-x86/www-apache/mod_scgi/mod_scgi-1.14.ebuild,v 1.4 2012/10/12 08:55:20 patrick Exp $

EAPI="3"

inherit apache-module

DESCRIPTION="Apache module for a replacement of the CGI protocol, similar to FastCGI."
HOMEPAGE="http://python.ca/scgi/ http://pypi.python.org/pypi/scgi"
SRC_URI="http://python.ca/scgi/releases/scgi-${PV}.tar.gz"

LICENSE="CNRI"
SLOT="0"
KEYWORDS="~amd64 hppa ~ppc x86"
IUSE=""

DEPEND="~www-apps/scgi-${PV}"
RDEPEND="${DEPEND}"

S="${WORKDIR}/scgi-${PV}"

APXS2_S="${S}/apache2"
APACHE2_MOD_FILE="${S}/apache2/.libs/${PN}.so"
APACHE2_MOD_CONF="20_mod_scgi"
APACHE2_MOD_DEFINE="SCGI"

DOCFILES="PKG-INFO LICENSE.txt CHANGES.txt apache2/README.txt"

need_apache2_2
