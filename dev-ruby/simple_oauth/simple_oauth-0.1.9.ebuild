# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-ruby/cvs-repo/gentoo-x86/dev-ruby/simple_oauth/simple_oauth-0.1.9.ebuild,v 1.1 2012/08/13 00:11:53 flameeyes Exp $

EAPI=4

USE_RUBY="ruby18 ruby19 ree18 jruby"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Simply builds and verifies OAuth headers."
HOMEPAGE="https://github.com/laserlemon/simple_oauth"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

each_ruby_test() {
	export CI=true
	each_fakegem_test
}
