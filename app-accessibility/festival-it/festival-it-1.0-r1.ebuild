# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-accessibility/cvs-repo/gentoo-x86/app-accessibility/festival-it/festival-it-1.0-r1.ebuild,v 1.2 2009/05/08 21:32:51 neurogeek Exp $

EAPI="2"

inherit eutils

DESCRIPTION="A collection of italian voices for Festival TTS."
HOMEPAGE="http://www.pd.istc.cnr.it/TTS/It-FESTIVAL.htm"
SRC_URI="mirror://sourceforge/it-festival/Italian-FESTIVAL.zip"

RDEPEND=">=app-accessibility/festival-1.96_beta[mbrola?]
		mbrola? ( >=app-accessibility/mbrola-3.0.1h-r4[linguas_it] )"
DEPEND="app-arch/unzip"
IUSE="mbrola"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

pkg_postinst () {
	einfo "Italian voices installed:"
	for VOICE in `ls "${ROOT}/usr/share/festival/voices/italian/"`; do
	  einfo "   (voice_${VOICE})"
	done
}

src_unpack () {
	unpack ${A}

	unzip -qo italian_scm.zip
	unzip -qo lex_ifd.zip
	unzip -qo lp_diphone.zip
	unzip -qo pc_diphone.zip

	if use mbrola; then
	  unzip -qo lp_mbrola_unix.zip
	  unzip -qo pc_mbrola_unix.zip
	fi

	# Deletes some useless files
	rm -f *.zip

	rm -f `find festival/ -name install_unix.txt`
	rm -f `find festival/ -name italian_mbrola_win.scm`

	if ! use mbrola; then
	  rm -f `find festival/ -name italian_mbrola_unix.scm`
	fi

	# Aggregates some README files
	mkdir docs
	mv `find festival/ -name \*README` docs/

	# All remaining files are moved "here"
	mv festival/lib/* .
	rm -rf festival/
}

src_install () {
	# Install the docs
	dodoc "${WORKDIR}"/docs/*

	# Install the voice scheme
	insinto /usr/share/festival/
	doins -r "${WORKDIR}"/italian_scm/

	# Install the dicts
	insinto /usr/share/festival/dicts
	doins -r "${WORKDIR}"/dicts/*

	# Installs the voices
	insinto /usr/share/festival/voices
	doins -r "${WORKDIR}"/voices/*

	# Enables the mbrola-based voices
	if use mbrola; then
	  dosym /opt/mbrola/it3 /usr/share/festival/voices/italian/pc_mbrola/it3
	  dosym /opt/mbrola/it4 /usr/share/festival/voices/italian/lp_mbrola/it4
	fi
}
