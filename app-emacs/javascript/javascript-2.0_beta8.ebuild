# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-emacs/cvs-repo/gentoo-x86/app-emacs/javascript/javascript-2.0_beta8.ebuild,v 1.6 2011/06/11 14:30:47 ulm Exp $

inherit elisp

DESCRIPTION="Major mode for editing JavaScript source text"
HOMEPAGE="http://www.karllandstrom.se/emacs_modes.php
	http://www.emacswiki.org/emacs/JavaScriptMode"
# taken from http://web.comhem.se/~u34308910/emacs/javascript.el.zip
SRC_URI="mirror://gentoo/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-fbsd"
IUSE=""

SITEFILE=50${PN}-gentoo.el
