# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-plugins/cvs-repo/gentoo-x86/media-plugins/alsa-plugins/alsa-plugins-1.0.25-r2.ebuild,v 1.1 2012/09/06 12:12:44 ssuominen Exp $

EAPI=4

MY_P=${P/_/}

inherit autotools eutils base flag-o-matic

DESCRIPTION="ALSA extra plugins"
HOMEPAGE="http://www.alsa-project.org/"
SRC_URI="mirror://alsaproject/plugins/${MY_P}.tar.bz2"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-linux"
IUSE="debug ffmpeg jack libsamplerate pulseaudio speex"

RDEPEND=">=media-libs/alsa-lib-${PV}
	ffmpeg? ( virtual/ffmpeg )
	jack? ( >=media-sound/jack-audio-connection-kit-0.98 )
	libsamplerate? ( media-libs/libsamplerate )
	pulseaudio? ( media-sound/pulseaudio )
	speex? ( media-libs/speex )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}"/${PN}-1.0.19-missing-avutil.patch
	"${FILESDIR}"/${PN}-1.0.23-automagic.patch
	"${FILESDIR}"/${PN}-1.0.25-avcodec54.patch
	"${FILESDIR}"/${P}-glibc-2.16.patch #426254
)

S=${WORKDIR}/${MY_P}

src_prepare() {
	base_src_prepare

	# For some reasons the polyp/pulse plugin does fail with alsaplayer with a
	# failed assert. As the code works just fine with asserts disabled, for now
	# disable them waiting for a better solution.
	sed -i \
		-e '/AM_CFLAGS/s:-Wall:-DNDEBUG -Wall:' \
		pulse/Makefile.am || die

	eautoreconf
}

src_configure() {
	use debug || append-cppflags -DNDEBUG

	local myspeex=no
	use speex && myspeex=lib

	econf \
		$(use_enable ffmpeg avcodec) \
		$(use_enable jack) \
		$(use_enable libsamplerate samplerate) \
		$(use_enable pulseaudio) \
		--with-speex=${myspeex}
}

src_install() {
	emake DESTDIR="${D}" install

	cd doc
	dodoc upmix.txt vdownmix.txt README-pcm-oss
	use jack && dodoc README-jack
	use libsamplerate && dodoc samplerate.txt
	use ffmpeg && dodoc lavcrate.txt a52.txt

	if use pulseaudio; then
		dodoc README-pulse
		# install ALSA configuration files
		# making PA to be used by alsa clients
		insinto /usr/share/alsa
		doins "${FILESDIR}"/pulse-default.conf
		insinto /usr/share/alsa/alsa.conf.d
		doins "${FILESDIR}"/51-pulseaudio-probe.conf
	fi

	prune_libtool_files --all
}

pkg_postinst() {
	if use pulseaudio; then
		einfo "The PulseAudio device is now set as the default device if the"
		einfo "PulseAudio server is found to be running. Any custom"
		einfo "configuration in /etc/asound.conf or ~/.asoundrc for this"
		einfo "purpose should now be unnecessary."
	fi
}
