# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-libs/cvs-repo/gentoo-x86/dev-libs/STLport/STLport-5.2.1.ebuild,v 1.5 2011/04/25 14:38:07 armin76 Exp $

EAPI="2"

inherit eutils versionator toolchain-funcs multilib

PATCH_V="1"

DESCRIPTION="C++ STL library"
HOMEPAGE="http://stlport.sourceforge.net/"
SRC_URI="mirror://sourceforge/stlport/${P}.tar.bz2
	mirror://gentoo/distfiles/${PN}-patches-${PV}-${PATCH_V}.tbz2"
LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 ~hppa ppc ppc64 sparc x86"
IUSE="boost debug static static-libs threads"

DEPEND="boost? ( >=dev-libs/boost-1.35.0-r5 )"
RDEPEND="${DEPEND}"

pkg_setup() {
	# make sure OSNAME is not in the environment (bug #305399)
	unset OSNAME
}

src_prepare() {
	EPATCH_SOURCE="${WORKDIR}/patches"
	EPATCH_SUFFIX="diff"
	epatch

	# We have to add this to host.h to make sure
	# that dependencies of STLport use the same settings
	cat <<- EOF >> stlport/stl/config/host.h
	#define _STLP_NATIVE_INCLUDE_PATH ../g++-v$(gcc-major-version)
	/* use pthreads for threading */
	#define _PTHREADS
	/* enable largefile support */
	#define _FILE_OFFSET_BITS 64
	#define _LARGEFILE_SOURCE
	#define _LARGEFILE64_SOURCE
	EOF
}

src_configure() {
	local myconf

	if use boost ; then
		BOOST_PKG="$(best_version ">=dev-libs/boost-1.35.0-r5")"
		BOOST_VER="$(get_version_component_range 1-2 "${BOOST_PKG/*boost-/}")"
		BOOST_VER="$(replace_all_version_separators _ "${BOOST_VER}")"
		BOOST_INC="/usr/include/boost-${BOOST_VER}"

		myconf+="--with-boost=${BOOST_INC} --with-system-boost "
		# make sure user apps (e.g. other packges using STLport) use boost as well
		sed -i \
			-e 'N;N;N;s:/\**\n\(#define _STLP_USE_BOOST_SUPPORT 1\)*\n\*/:\1:' \
			stlport/stl/config/user_config.h
	fi

	use debug || myconf+="--without-debug "
	use static-libs && myconf+="--enable-static "
	use threads || myconf+="--without-thread "
	use static && myconf+="--use-static-gcc "

	# It's not an autoconf script
	./configure \
		--prefix=/usr \
		--libdir=/usr/$(get_libdir) \
		--use-compiler-family=gcc \
		${myconf} \
		--with-cc="$(tc-getCC)" \
		--with-cxx="$(tc-getCXX)" \
		--with-extra-cflags="${CFLAGS}" \
		--with-extra-cxxflags="${CXXFLAGS}" \
		--with-extra-ldflags="${LDFLAGS}" || die "configure failed"
}

src_install() {
	# precreate some directories
	dodir /usr/$(get_libdir)

	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc README etc/ChangeLog etc/*.txt doc/*.txt doc/{FAQ,README.utf8}
}

src_test() {
	if use static ; then
		ewarn "Tests don't work when building with USE=static. Skipping..."
		return
	fi
	default
}
