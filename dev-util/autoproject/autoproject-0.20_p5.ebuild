# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-util/cvs-repo/gentoo-x86/dev-util/autoproject/autoproject-0.20_p5.ebuild,v 1.1 2010/02/14 00:32:23 vapier Exp $

inherit eutils

MY_PV=${PV%_p*}
DEB_VER=${PV#*_p}
DESCRIPTION="Used to start a programming project using autotools and a command line parser generator"
HOMEPAGE="http://packages.debian.org/unstable/devel/autoproject"
SRC_URI="mirror://debian/pool/main/a/autoproject/${PN}_${MY_PV}.orig.tar.gz
	mirror://debian/pool/main/a/autoproject/${PN}_${MY_PV}-${DEB_VER}.diff.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE="test"

RDEPEND="sys-devel/automake
	sys-devel/autoconf"
DEPEND="${RDEPEND}
	test? ( sys-apps/texinfo )"

S=${WORKDIR}/${PN}-${MY_PV}

src_unpack() {
	unpack ${A}
	epatch ${PN}_${MY_PV}-${DEB_VER}.diff
}

src_install() {
	emake install DESTDIR="${D}" || die
	dodoc AUTHORS NEWS README TODO ChangeLog
}
