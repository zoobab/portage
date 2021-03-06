# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/virtual/cvs-repo/gentoo-x86/virtual/ruby-minitest/ruby-minitest-0.ebuild,v 1.15 2010/09/29 21:37:54 ranger Exp $

EAPI=2
USE_RUBY="ruby18 jruby"

inherit ruby-ng

DESCRIPTION="Virtual ebuild for the Ruby minitest library"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 hppa ia64 ppc ppc64 sparc x86"
IUSE=""

RDEPEND="ruby_targets_ruby18? ( dev-ruby/minitest[ruby_targets_ruby18] )
	ruby_targets_jruby? ( dev-ruby/minitest[ruby_targets_jruby] )"
DEPEND=""
