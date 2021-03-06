# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/virtual/cvs-repo/gentoo-x86/virtual/pam/pam-0.ebuild,v 1.2 2012/04/26 13:54:31 aballier Exp $

EAPI=3

DESCRIPTION="Virtual for PAM (Pluggable Authentication Modules)"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~amd64-linux ~ia64-linux ~x86-linux"
IUSE=""

DEPEND=""
RDEPEND="|| ( >=sys-libs/pam-0.78
		sys-auth/openpam )"
