# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-base/cvs-repo/gentoo-x86/kde-base/libkdeedu/libkdeedu-4.9.1.ebuild,v 1.1 2012/09/04 18:45:10 johu Exp $

EAPI=4

inherit kde4-base

DESCRIPTION="Common library for KDE educational apps"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

# 4 of 4 tests fail. Last checked for 4.6.1. Tests are fundamentally broken,
# see bug 258857 for details.
RESTRICT=test

add_blocker kvtml-data
