# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/rox-extra/cvs-repo/gentoo-x86/rox-extra/roxdao/roxdao-0.4-r1.ebuild,v 1.5 2008/08/30 15:37:45 ranger Exp $

ROX_LIB_VER=2.0.3
inherit rox

MY_PN="RoxDAO"
DESCRIPTION="RoxDAO: A graphical frontend to cdrdao for the ROX Desktop."
HOMEPAGE="http://kymatica.com/index.php/Software"
SRC_URI="http://kymatica.com/uploads/Software/${MY_PN}-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE=""

DEPEND="app-cdr/cdrdao
	rox-extra/mp3ogg2wav"

APPNAME=${MY_PN}
APPCATEGORY="AudioVideo;DiscBurning"
S=${WORKDIR}
