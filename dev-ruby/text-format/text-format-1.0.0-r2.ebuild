# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-ruby/cvs-repo/gentoo-x86/dev-ruby/text-format/text-format-1.0.0-r2.ebuild,v 1.12 2011/09/14 16:08:18 jer Exp $

EAPI=2
USE_RUBY="ruby18 ree18 jruby"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README Changelog ToDo"

inherit ruby-fakegem

DESCRIPTION="Text::Format provides strong text formatting capabilities to Ruby"
HOMEPAGE="http://rubyforge.org/projects/text-format/"
SRC_URI="mirror://rubyforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 hppa ia64 ppc ppc64 sparc x86 ~x86-fbsd ~x86-solaris"
IUSE=""

ruby_add_rdepend '>=dev-ruby/text-hyphen-1.0.0'
ruby_add_bdepend "test? ( dev-ruby/archive-tar-minitar )"

all_ruby_prepare() {
	# Fix rakefile for new rake versions
	sed -i -e 's: if t\.verbose::' Rakefile || die
}
