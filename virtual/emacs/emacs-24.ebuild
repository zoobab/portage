# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/virtual/cvs-repo/gentoo-x86/virtual/emacs/emacs-24.ebuild,v 1.10 2012/10/09 07:29:37 ulm Exp $

EAPI=4

DESCRIPTION="Virtual for GNU Emacs"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x86-solaris"

RDEPEND="|| ( app-editors/emacs:24
		>=app-editors/emacs-vcs-24.1 )"
