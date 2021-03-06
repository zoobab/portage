# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-block/cvs-repo/gentoo-x86/sys-block/afacli/afacli-4.1.ebuild,v 1.1 2008/05/24 10:41:57 wschlich Exp $

inherit rpm

MY_PV=${PV}-0
DESCRIPTION="Dell AACRAID-based PERC RAID controller management tool"
HOMEPAGE="http://linux.dell.com/"
SRC_URI="ftp://ftp.dell.com/scsi-raid/afa-apps-snmp.2807420-A04.tar.gz"

LICENSE="Dell"
SLOT="0"
# This package can never enter stable, it can't be mirrored and upstream
# can remove the distfiles from their mirror anytime.
KEYWORDS="~x86"
IUSE=""

RESTRICT="strip mirror test"

RDEPEND="sys-libs/lib-compat"

S="${WORKDIR}"

src_unpack() {
	unpack ${A}
	rpm_unpack "${S}"/afaapps-${MY_PV}.i386.rpm || die "failed to unpack RPM"
}

src_compile() {
	echo "Nothing to compile."
}

src_install() {
	dosbin "${FILESDIR}"/afacli
	newsbin usr/sbin/afacli afacli.bin
	dodoc usr/sbin/getcfg.afa
}
