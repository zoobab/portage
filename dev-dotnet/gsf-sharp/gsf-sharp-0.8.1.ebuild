# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-dotnet/cvs-repo/gentoo-x86/dev-dotnet/gsf-sharp/gsf-sharp-0.8.1.ebuild,v 1.4 2012/05/04 03:56:57 jdhore Exp $

inherit eutils mono autotools

DESCRIPTION="C# bindings for libgsf"
HOMEPAGE="http://www.mono-project.com/"
SRC_URI="mirror://gentoo/${P}.tar.gz"
LICENSE="LGPL-2"

SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""
RDEPEND="dev-lang/mono
	>=gnome-extra/libgsf-1.14.1
	>=dev-dotnet/gtk-sharp-2.4.0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_install() {
	make install DESTDIR="${D}"
	dodoc AUTHORS ChangeLog NEWS README
}
