# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-ruby/cvs-repo/gentoo-x86/dev-ruby/aws-s3/aws-s3-0.6.3.ebuild,v 1.1 2012/06/15 07:53:23 flameeyes Exp $

EAPI=4

USE_RUBY="ruby18 ruby19 ree18 jruby"

RUBY_FAKEGEM_TASK_DOC="doc:rdoc"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README"

# there is a stupid setup.rb in the bin/ directory so do not use the
# default.
RUBY_FAKEGEM_BINWRAP="s3sh"

inherit ruby-fakegem

DESCRIPTION="Client library for Amazon's Simple Storage Service's REST API"
HOMEPAGE="http://amazon.rubyforge.org/"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "dev-ruby/xml-simple
				dev-ruby/builder
				dev-ruby/mime-types
				virtual/ruby-ssl"
ruby_add_bdepend "test? ( virtual/ruby-test-unit dev-ruby/flexmock )"

RUBY_PATCHES=(
	${P}+ruby19.patch
)
