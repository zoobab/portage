# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/media-sound/cvs-repo/gentoo-x86/media-sound/moc/moc-2.5.0_beta1.ebuild,v 1.1 2012/10/14 20:49:06 radhermit Exp $

EAPI=4

MY_P=${P/_/-}

DESCRIPTION="Music On Console - ncurses interface for playing audio files"
HOMEPAGE="http://moc.daper.net"
SRC_URI="ftp://ftp.daper.net/pub/soft/moc/unstable/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="aac alsa curl debug ffmpeg flac jack libsamplerate mad +magic modplug musepack
oss sid sndfile speex timidity +unicode vorbis wavpack"

# libltdl from libtool is used at runtime
RDEPEND=">=sys-devel/libtool-2.2.6b
	>=sys-libs/db-4
	dev-libs/popt
	sys-libs/ncurses[unicode?]
	aac? ( media-libs/faad2 )
	alsa? ( media-libs/alsa-lib )
	curl? ( net-misc/curl )
	ffmpeg? ( virtual/ffmpeg )
	flac? ( media-libs/flac )
	jack? ( media-sound/jack-audio-connection-kit )
	libsamplerate? ( media-libs/libsamplerate )
	mad? ( media-libs/libmad sys-libs/zlib media-libs/libid3tag )
	magic? ( sys-apps/file )
	modplug? ( media-libs/libmodplug )
	musepack? ( media-sound/musepack-tools media-libs/taglib )
	sid? ( >=media-libs/libsidplay-2 )
	sndfile? ( media-libs/libsndfile )
	speex? ( media-libs/speex )
	timidity? ( media-libs/libtimidity media-sound/timidity++ )
	vorbis? ( media-libs/libogg media-libs/libvorbis )
	wavpack? ( media-sound/wavpack )"
DEPEND="${RDEPEND}
	app-arch/xz-utils
	virtual/pkgconfig"

S=${WORKDIR}/${MY_P}

src_configure() {
	local myconf=(
		--docdir="${EPREFIX}"/usr/share/doc/${PF}
		$(use_enable debug)
		$(use_with oss)
		$(use_with alsa)
		$(use_with jack)
		$(use_with magic)
		$(use_with unicode ncursesw)
		$(use_with libsamplerate samplerate)
		$(use_with aac)
		$(use_with ffmpeg)
		$(use_with flac)
		$(use_with modplug)
		$(use_with mad mp3)
		--without-rcc
		$(use_with musepack)
		$(use_with sid sidplay2)
		$(use_with sndfile)
		$(use_with speex)
		$(use_with timidity)
		$(use_with vorbis)
		$(use_with wavpack)
		$(use_with curl)
		)

	econf "${myconf[@]}"
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS NEWS TODO # The rest is installed by doc_DATA from "${S}"/Makefile.am
	find "${ED}" -name '*.la' -exec sed -i -e "/^dependency_libs/s:=.*:='':" {} +
}
