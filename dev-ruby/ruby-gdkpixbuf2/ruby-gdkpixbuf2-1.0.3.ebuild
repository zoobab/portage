# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-ruby/cvs-repo/gentoo-x86/dev-ruby/ruby-gdkpixbuf2/ruby-gdkpixbuf2-1.0.3.ebuild,v 1.5 2012/04/17 18:40:57 jdhore Exp $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_NAME="gdk_pixbuf2"

inherit ruby-ng-gnome2

S=${WORKDIR}/ruby-gnome2-all-${PV}/gdk_pixbuf2

DESCRIPTION="Ruby GdkPixbuf2 bindings"
KEYWORDS="amd64 ~ppc x86"
IUSE=""

RDEPEND="x11-libs/gtk+:2"

ruby_add_rdepend ">=dev-ruby/ruby-glib2-${PV}"
