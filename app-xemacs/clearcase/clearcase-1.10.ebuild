# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-xemacs/cvs-repo/gentoo-x86/app-xemacs/clearcase/clearcase-1.10.ebuild,v 1.3 2007/06/03 17:51:17 graaff Exp $

SLOT="0"
IUSE=""
DESCRIPTION="New Clearcase Version Control for XEmacs (UNIX, Windows)."
PKG_CAT="standard"

RDEPEND="app-xemacs/dired
app-xemacs/mail-lib
app-xemacs/xemacs-base
app-xemacs/sh-script
"
KEYWORDS="alpha amd64 ppc ppc64 sparc x86"

inherit xemacs-packages
