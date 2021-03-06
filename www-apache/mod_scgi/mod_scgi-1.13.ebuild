# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/www-apache/cvs-repo/gentoo-x86/www-apache/mod_scgi/mod_scgi-1.13.ebuild,v 1.1 2009/09/17 09:02:53 hollow Exp $

inherit apache-module

DESCRIPTION="Apache module for a replacement of the CGI protocol, similar to FastCGI."
HOMEPAGE="http://python.ca/scgi/"
SRC_URI="http://python.ca/scgi/releases/scgi-${PV}.tar.gz"

LICENSE="CNRI"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~x86"
IUSE=""

DEPEND="www-apps/scgi"
RDEPEND="${DEPEND}"

S="${WORKDIR}/scgi-${PV}"

APXS2_S="${S}/apache2"
APACHE2_MOD_FILE="${S}/apache2/.libs/${PN}.so"
APACHE2_MOD_CONF="20_mod_scgi"
APACHE2_MOD_DEFINE="SCGI"

DOCFILES="PKG-INFO LICENSE.txt CHANGES.txt apache2/README.txt"

need_apache
