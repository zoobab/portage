# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-python/cvs-repo/gentoo-x86/dev-python/twisted-pair/twisted-pair-12.0.0.ebuild,v 1.1 2012/03/22 07:07:38 patrick Exp $

EAPI="4"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython"
MY_PACKAGE="Pair"

inherit twisted versionator

DESCRIPTION="Twisted low-level networking"

KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=dev-python/twisted-$(get_version_component_range 1-2)*
	dev-python/eunuchs"
RDEPEND="${DEPEND}"

PYTHON_MODNAME="twisted/pair"
