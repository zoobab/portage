# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-plugins/cvs-repo/gentoo-x86/media-plugins/gst-plugins-faad/gst-plugins-faad-0.10.21.ebuild,v 1.7 2011/09/25 17:55:29 armin76 Exp $

inherit gst-plugins-bad

KEYWORDS="alpha amd64 ~arm hppa ~ia64 ppc ppc64 sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND="media-libs/faad2
	>=media-libs/gst-plugins-base-0.10.32"
DEPEND="${RDEPEND}"
