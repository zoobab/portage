# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-mobilephone/cvs-repo/gentoo-x86/app-mobilephone/ganyremote/ganyremote-6.0.1.ebuild,v 1.3 2012/09/10 11:56:15 johu Exp $

EAPI="2"

inherit eutils

DESCRIPTION="Gnome frontend to Anyremote"
HOMEPAGE="http://anyremote.sourceforge.net/"
SRC_URI="mirror://sourceforge/anyremote/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="bluetooth"

DEPEND=">=app-mobilephone/anyremote-6.0[bluetooth=]
	dev-python/pygtk
	bluetooth? ( dev-python/pybluez )"
RDEPEND="${DEPEND}"

src_install() {
	emake install DESTDIR="${D}" || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README || die "dodoc failed"
}
