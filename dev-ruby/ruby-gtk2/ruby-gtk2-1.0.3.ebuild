# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-ruby/cvs-repo/gentoo-x86/dev-ruby/ruby-gtk2/ruby-gtk2-1.0.3.ebuild,v 1.5 2012/04/17 18:48:06 jdhore Exp $

EAPI="2"
USE_RUBY="ruby18"

inherit ruby-ng-gnome2

DESCRIPTION="Ruby Gtk2 bindings"
KEYWORDS="amd64 ~ppc x86"
IUSE=""

DEPEND="${DEPEND} x11-libs/gtk+:2"
RDEPEND="${RDEPEND} x11-libs/gtk+:2"

ruby_add_bdepend ">=dev-ruby/ruby-glib2-${PV}
	>=dev-ruby/ruby-pango-${PV}"
ruby_add_rdepend ">=dev-ruby/ruby-gdkpixbuf2-${PV}
	>=dev-ruby/ruby-atk-${PV}
	>=dev-ruby/ruby-gio2-${PV}"
