# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-plugins/cvs-repo/gentoo-x86/media-plugins/gst-plugins-pulse/gst-plugins-pulse-0.10.28.ebuild,v 1.7 2011/07/25 18:07:11 xarthisius Exp $

inherit gst-plugins-good

DESCRIPTION="GStreamer plugin for the PulseAudio sound server"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 ~sh sparc x86"
IUSE=""

# >=0.9.20 is the latest suggested dep for some optional features/best behaviour not available before
RDEPEND=">=media-sound/pulseaudio-0.9.20
	>=media-libs/gst-plugins-base-0.10.32"
DEPEND="${RDEPEND}"
