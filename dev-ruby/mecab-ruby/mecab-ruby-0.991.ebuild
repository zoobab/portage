# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-ruby/cvs-repo/gentoo-x86/dev-ruby/mecab-ruby/mecab-ruby-0.991.ebuild,v 1.2 2012/05/01 18:24:18 armin76 Exp $

EAPI=4
# jruby: failed
USE_RUBY="ruby18 ruby19 ree18 rbx"

inherit ruby-ng

IUSE=""

DESCRIPTION="Ruby binding for MeCab"
HOMEPAGE="http://mecab.sourceforge.net/"
SRC_URI="http://mecab.googlecode.com/files/${P}.tar.gz"

LICENSE="|| ( BSD LGPL-2.1 GPL-2 )"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
SLOT="0"

DEPEND=">=app-text/mecab-${PV}"
RDEPEND="${DEPEND}"

each_ruby_configure() {
	${RUBY} extconf.rb || die
}

each_ruby_compile() {
	emake || die
}

each_ruby_install() {
	emake install DESTDIR="${D}" || die
}

all_ruby_install() {
	dodoc AUTHORS README test.rb || die
	dohtml bindings.html || die
}
