# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-perl/cvs-repo/gentoo-x86/dev-perl/MogileFS-Utils/MogileFS-Utils-2.20.ebuild,v 1.1 2011/06/16 08:32:13 robbat2 Exp $

MODULE_AUTHOR="DORMANDO"
inherit perl-module

DESCRIPTION="Server for the MogileFS distributed file system"

IUSE=""

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="~amd64 ~ppc ~x86"

DEPEND="virtual/perl-IO-Compress
		dev-perl/libwww-perl
		>=dev-perl/MogileFS-Client-1.14"
