# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-perl/cvs-repo/gentoo-x86/dev-perl/Video-ivtv/Video-ivtv-0.13.ebuild,v 1.10 2008/03/20 17:45:57 beandog Exp $

inherit perl-module

DESCRIPTION="Video::ivtv perl module, for use with ivtv-ptune"
HOMEPAGE="http://ivtv.sourceforge.net"
SRC_URI="mirror://sourceforge/ivtv/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ia64 ppc x86"
IUSE=""

export OPTIMIZE="$CFLAGS"
mydoc="README COPYING"

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"
