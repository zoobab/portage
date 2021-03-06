# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/rox-extra/cvs-repo/gentoo-x86/rox-extra/find/find-007-r1.ebuild,v 1.6 2008/08/18 04:41:30 mr_bones_ Exp $

ROX_LIB_VER=2.0.0
inherit rox

MY_PN="Find"
DESCRIPTION="Find - A file Finder utility for ROX by Ken Hayber."
HOMEPAGE="http://rox-find.googlecode.com"
SRC_URI="http://rox-find.googlecode.com/files/${MY_PN}-${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

APPNAME=${MY_PN}
APPCATEGORY="Utility"
S=${WORKDIR}
