# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-vim/cvs-repo/gentoo-x86/app-vim/perl-support/perl-support-5.1.ebuild,v 1.1 2012/08/05 23:56:04 radhermit Exp $

EAPI=4

inherit vim-plugin

DESCRIPTION="vim plugin: Perl-IDE - Write and run Perl scripts using menus and hotkeys"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=556"
LICENSE="as-is"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux ~x86-macos"
IUSE=""

VIM_PLUGIN_HELPFILES="perlsupport.txt"

RDEPEND="dev-perl/Perl-Tags
	dev-perl/Perl-Critic"

src_prepare() {
	# Don't set tabstop and shiftwidth
	sed -i -e '/=4/s/^/"/' ftplugin/perl.vim
}

src_install() {
	dodoc ${PN}/doc/{ChangeLog,perl-hot-keys.pdf}
	rm -r ${PN}/doc/ || die

	vim-plugin_src_install
}
