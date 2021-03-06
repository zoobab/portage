# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/x11-plugins/cvs-repo/gentoo-x86/x11-plugins/gkrellsun/gkrellsun-1.0.0-r1.ebuild,v 1.4 2007/07/11 20:39:22 mr_bones_ Exp $

inherit gkrellm-plugin

IUSE="nls"
DESCRIPTION="A GKrellM plugin that shows sunrise and sunset times."
HOMEPAGE="http://gkrellsun.sourceforge.net/"
SRC_URI="mirror://sourceforge/gkrellsun/${P}.tar.gz"

SLOT="1"
LICENSE="GPL-2"
KEYWORDS="alpha amd64 hppa ia64 ppc sparc x86"

DEPEND="nls? ( sys-devel/gettext )"

PLUGIN_SO=src20/gkrellsun.so

src_compile() {
	use nls && myconf="$myconf enable_nls=1"
	emake ${myconf}
}
