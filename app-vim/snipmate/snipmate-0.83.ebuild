# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-vim/cvs-repo/gentoo-x86/app-vim/snipmate/snipmate-0.83.ebuild,v 1.4 2010/02/01 16:40:30 hwoarang Exp $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: TextMate-style snippets"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2540"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=11006 -> ${P}.zip"
LICENSE="as-is"
KEYWORDS="amd64 x86"
IUSE=""

S="${WORKDIR}"

VIM_PLUGIN_HELPFILES="${PN}"
VIM_PLUGIN_MESSAGES="filetype"

DEPEND="app-arch/unzip"
RDEPEND=""
