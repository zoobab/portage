# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-admin/cvs-repo/gentoo-x86/app-admin/webapp-config/webapp-config-1.50.18.ebuild,v 1.2 2012/04/27 19:43:57 blueness Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils eutils

DESCRIPTION="Gentoo's installer for web-based applications"
HOMEPAGE="http://sourceforge.net/projects/webapp-config/"
SRC_URI="mirror://gentoo/${P}.tar.gz
		 mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND=""
RESTRICT_PYTHON_ABIS="3.*"

PYTHON_MODNAME="WebappConfig"

src_prepare() {
	epatch "${FILESDIR}/${PN}-1.50.16-apache-move.patch"
	epatch "${FILESDIR}/${PN}-1.50.16-baselayout2.patch"
	epatch "${FILESDIR}/${PN}-1.50.16-htdocs-symlink.patch"
	#UPSTREAM-MERGED#epatch "${FILESDIR}/${PN}-1.50.16-absolute-paths.patch"
	epatch "${FILESDIR}/${PN}-1.50.16-update-servers.patch"
	# Do not build nor install eclass manual, bug 322759
	rm -f doc/webapp.eclass.5*
	sed -e '/MAN_PAGES/s/webapp.eclass.5//' \
		-e '/HTML_PAGES/s/webapp.eclass.5.html//' \
		-i doc/Makefile || die
}

src_install() {
	# According to this discussion:
	# http://mail.python.org/pipermail/distutils-sig/2004-February/003713.html
	# distutils does not provide for specifying two different script install
	# locations. Since we only install one script here the following should
	# be ok
	distutils_src_install --install-scripts="/usr/sbin"

	insinto /etc/vhosts
	doins config/webapp-config

	keepdir /usr/share/webapps
	keepdir /var/db/webapps

	dodoc examples/phpmyadmin-2.5.4-r1.ebuild AUTHORS.txt CHANGES.txt examples/postinstall-en.txt
	doman doc/*.[58]
	dohtml doc/*.[58].html
}

src_test() {
	testing() {
		PYTHONPATH="." "$(PYTHON)" WebappConfig/tests/dtest.py
	}
	python_execute_function testing
}

pkg_postinst() {
	distutils_pkg_postinst

	elog "Now that you have upgraded webapp-config, you **must** update your"
	elog "config files in /etc/vhosts/webapp-config before you emerge any"
	elog "packages that use webapp-config."
}
