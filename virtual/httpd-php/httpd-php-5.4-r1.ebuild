# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/virtual/cvs-repo/gentoo-x86/virtual/httpd-php/httpd-php-5.4-r1.ebuild,v 1.5 2012/09/17 23:28:43 blueness Exp $

EAPI="4"

DESCRIPTION="Virtual to provide PHP-enabled webservers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="${PV}"
KEYWORDS="~alpha amd64 arm hppa ~ia64 ~mips ppc ppc64 ~s390 ~sh ~sparc ~x86 ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE=""

RDEPEND="|| ( dev-lang/php:${SLOT}[apache2]
			  dev-lang/php:${SLOT}[cgi]
			  dev-lang/php:${SLOT}[fpm] )"
DEPEND=""
