# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-power/cvs-repo/gentoo-x86/sys-power/powermgmt-base/powermgmt-base-1.31.ebuild,v 1.9 2012/02/25 06:28:17 robbat2 Exp $

EAPI=2
inherit toolchain-funcs

DESCRIPTION="Script to test whether computer is running on AC power"
HOMEPAGE="http://packages.debian.org/testing/utils/powermgmt-base"
SRC_URI="mirror://debian/pool/main/p/${PN}/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm ia64 ppc ppc64 x86"
IUSE="+pm-utils"

RDEPEND="sys-apps/gawk
	sys-apps/grep
	virtual/modutils
	pm-utils? ( >=sys-power/pm-utils-1.4.1 )"

S=${WORKDIR}/${PN}

src_prepare() {
	sed -i \
		-e 's:$(CC) $(CFLAGS):$(CC) $(LDFLAGS) $(CFLAGS):' \
		src/Makefile || die
}

src_compile() {
	tc-export CC
	emake CFLAGS="${CFLAGS} -Wall -Wstrict-prototypes -DLINUX" || die
}

src_install() {
	dodir /sbin
	emake DESTDIR="${D}" install || die

	doman man/{acpi,apm}_available.1 || die

	if ! use pm-utils; then
		doman man/on_ac_power.1 || die
	else
		rm -f "${D}"/sbin/on_ac_power || die
	fi

	newdoc debian/powermgmt-base.README.Debian README
	dodoc debian/changelog
}
