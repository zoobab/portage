# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-ruby/cvs-repo/gentoo-x86/dev-ruby/tilt/tilt-1.3.3.ebuild,v 1.5 2012/06/29 07:35:12 graaff Exp $

EAPI=2

# jruby fails tests
USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md TEMPLATES.md"

inherit ruby-fakegem

DESCRIPTION="A thin interface over a Ruby template engines to make their usage as generic as possible."
HOMEPAGE="http://github.com/rtomayko/tilt"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RUBY_PATCHES=( "${P}-yajl-test.patch" )

ruby_add_bdepend "test? ( virtual/ruby-test-unit dev-ruby/nokogiri )"
ruby_add_rdepend ">=dev-ruby/builder-2.0.0"

# Tests fail when markaby is not new enough, but it's optional.
DEPEND="${DEPEND} !!<dev-ruby/markaby-0.6.9-r1"
RDEPEND="${RDEPEND}"

all_ruby_prepare() {
	# Remove rdoc template tests since these are no longer compatible
	# with newer versions.
	rm test/tilt_rdoctemplate_test.rb || die

	# Avoid test broken due to hash unordering in ruby 1.8. Fixed upstream.
	sed -i -e '/template can end with any statement/,/ end/ s:^:#:' test/tilt_yajltemplate_test.rb || die

	# Disable tests failing on whitespace differences and already fixed upstream.
	sed -i -e '/"disabling coffee-script wrapper"/,/ end/ s:^:#:' test/tilt_coffeescripttemplate_test.rb || die
}
