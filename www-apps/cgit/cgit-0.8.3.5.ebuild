# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/www-apps/cvs-repo/gentoo-x86/www-apps/cgit/cgit-0.8.3.5.ebuild,v 1.2 2012/06/01 04:30:38 zmedico Exp $

EAPI="2"

WEBAPP_MANUAL_SLOT="yes"

inherit webapp multilib user

[[ -z "${CGIT_CACHEDIR}" ]] && CGIT_CACHEDIR="/var/cache/${PN}/"

GIT_V="1.7.3"

DESCRIPTION="a fast web-interface for git repositories"
HOMEPAGE="http://hjemli.net/git/cgit/about/"
SRC_URI="mirror://kernel/software/scm/git/git-${GIT_V}.tar.bz2
	http://hjemli.net/git/cgit/snapshot/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc highlight"

RDEPEND="
	dev-vcs/git
	sys-libs/zlib
	dev-libs/openssl
	virtual/httpd-cgi
	highlight? ( app-text/highlight )
"
# ebuilds without WEBAPP_MANUAL_SLOT="yes" are broken
DEPEND="${RDEPEND}
	!<www-apps/cgit-0.8.3.3
	doc? ( app-text/docbook-xsl-stylesheets
		>=app-text/asciidoc-8.5.1 )
"

pkg_setup() {
	webapp_pkg_setup
	enewuser "${PN}"
}

src_prepare() {
	rmdir git || die
	mv "${WORKDIR}"/git-"${GIT_V}" git || die

	sed -i \
		-e "/^CACHE_ROOT =/s:/var/cache/cgit:${CGIT_CACHEDIR}:" \
		Makefile || die
}

src_compile() {
	emake || die
	if use doc ; then
		emake man-doc || die
	fi
}

src_install() {
	webapp_src_preinst

	emake \
		CGIT_SCRIPT_PATH="${MY_CGIBINDIR}" \
		CGIT_DATA_PATH="${MY_HTDOCSDIR}" \
		DESTDIR="${D}" install || die

	exeinto /usr/$(get_libdir)/${PN}/filters
	doexe filters/*.sh

	insinto /etc
	doins "${FILESDIR}"/cgitrc

	dodoc README
	use doc && doman cgitrc.5

	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt
	webapp_src_install

	keepdir "${CGIT_CACHEDIR}"
	fowners ${PN}:${PN} "${CGIT_CACHEDIR}"
	fperms 700 "${CGIT_CACHEDIR}"
}

pkg_postinst() {
	ewarn "If you intend to run cgit using web server's user"
	ewarn "you should change /var/cache/cgit/ permissions."
}
