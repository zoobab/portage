# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-php/cvs-repo/gentoo-x86/dev-php/PEAR-HTTP_Request/PEAR-HTTP_Request-1.4.2.ebuild,v 1.9 2008/11/09 11:48:53 vapier Exp $

inherit php-pear-r1

DESCRIPTION="Provides an easy way to perform HTTP requests"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86"
IUSE=""

RDEPEND=">=dev-php/PEAR-Net_URL-1.0.14-r1
	>=dev-php/PEAR-Net_Socket-1.0.6-r1"
