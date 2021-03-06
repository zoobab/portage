# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-misc/cvs-repo/gentoo-x86/kde-misc/kbiff/kbiff-4.0.ebuild,v 1.1 2012/05/01 18:05:38 dilfridge Exp $

EAPI=4

KDE_LINGUAS="br cs da de el es et fi fr he hr hu is it ja nb nl nn pl pt pt_BR ro ru sk sl sv tr uk zh_TW"
inherit kde4-base

DESCRIPTION="New mail notification utility"
HOMEPAGE="http://www.kbiff.org"
SRC_URI="http://prdownloads.sourceforge.net/kbiff/${P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="4"
IUSE=""
