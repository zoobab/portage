# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-ruby/cvs-repo/gentoo-x86/dev-ruby/activeresource/activeresource-2.3.14.ebuild,v 1.6 2012/05/01 18:24:20 armin76 Exp $

EAPI=2

USE_RUBY="ruby18 ree18 jruby"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README"

inherit ruby-fakegem

DESCRIPTION="Think Active Record for web resources.."
HOMEPAGE="http://rubyforge.org/projects/activeresource/"

LICENSE="MIT"
SLOT="2.3"
KEYWORDS="amd64 ppc ppc64 x86 -x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_rdepend "~dev-ruby/activesupport-${PV}"
ruby_add_bdepend "
	test? (
		>=dev-ruby/mocha-0.9.5
		virtual/ruby-test-unit
	)"

all_ruby_prepare() {
	epatch "${FILESDIR}/${PN}-2.3.10-rails3.patch"

	# Custom template not found in package
	sed -i -e '/horo/d' Rakefile || die
}
