# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-util/cvs-repo/gentoo-x86/dev-util/cucumber-rails/cucumber-rails-1.2.1.ebuild,v 1.4 2012/08/14 15:47:51 flameeyes Exp $

EAPI=2
USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_TASK_DOC=""

# There are also cucumber features. They require a Rails project with
# factory girl which we don't have packaged yet.
RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_EXTRADOC="History.md README.md"

RUBY_FAKEGEM_GEMSPEC="cucumber-rails.gemspec"

inherit ruby-fakegem

DESCRIPTION="Executable feature scenarios for Rails"
HOMEPAGE="https://github.com/cucumber/cucumber/wikis"
LICENSE="Ruby"

KEYWORDS="~amd64"
SLOT="1"
IUSE=""

ruby_add_bdepend "
	test? (
		>=dev-ruby/ammeter-0.2.1
		dev-ruby/rspec-rails
	)"

ruby_add_rdepend "
	>=dev-util/cucumber-1.1.3
	>=dev-ruby/nokogiri-1.5.0
	>=dev-ruby/capybara-1.1.2"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/d' Rakefile || die
	sed -i -e '/git ls/d' ${RUBY_FAKEGEM_GEMSPEC} || die
}
