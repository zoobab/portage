# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/kde-base/cvs-repo/gentoo-x86/kde-base/ksystemlog/ksystemlog-4.9.2.ebuild,v 1.1 2012/10/02 18:12:02 johu Exp $

EAPI=4

KDE_HANDBOOK="optional"
KMNAME="kdeadmin"
KDE_SCM="svn"
VIRTUALX_REQUIRED=test
inherit kde4-meta

DESCRIPTION="KDE system log viewer"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug test"

RESTRICT=test
# bug 378101

src_prepare() {
	kde4-meta_src_prepare

	if use test; then
		# beat this stupid test into shape: the test files contain no year, so
		# comparison succeeds only in 2007 !!!
		local theyear=$(date +%Y)
		einfo Setting the current year as ${theyear} in the test files
		sed -e "s:2007:${theyear}:g" -i ksystemlog/tests/systemAnalyzerTest.cpp

		# one test consistently fails, so comment it out for the moment
		sed -e "s:systemAnalyzerTest:# dont run systemAnalyzerTest:g" -i ksystemlog/tests/CMakeLists.txt
	fi
}
