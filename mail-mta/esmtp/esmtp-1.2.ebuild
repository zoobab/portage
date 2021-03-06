# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/mail-mta/cvs-repo/gentoo-x86/mail-mta/esmtp/esmtp-1.2.ebuild,v 1.8 2011/06/22 21:32:29 ranger Exp $

DESCRIPTION="esmtp is a user configurable relay-only Mail Transfer Agent (MTA) with a sendmail compatible syntax"
HOMEPAGE="http://esmtp.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~amd64-linux ~x86-linux ~x86-macos"
IUSE=""

DEPEND="net-libs/libesmtp
	dev-libs/openssl
	sys-devel/flex"
RDEPEND="net-libs/libesmtp
	dev-libs/openssl
	!mail-mta/courier
	!mail-mta/exim
	!mail-mta/mini-qmail
	!mail-mta/msmtp
	!mail-mta/nbsmtp
	!mail-mta/netqmail
	!mail-mta/nullmailer
	!mail-mta/postfix
	!mail-mta/qmail-ldap
	!mail-mta/sendmail
	!mail-mta/ssmtp"

src_install() {
	emake DESTDIR="${D}" install || die "einstall failed"
	dodoc AUTHORS ChangeLog NEWS README TODO sample.esmtprc || die
}

pkg_postinst() {
	elog "A sample esmtprc file has been installed in /usr/share/doc/${P}"
}
