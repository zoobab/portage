# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/www-apps/cvs-repo/gentoo-x86/www-apps/moinmoin/moinmoin-1.8.8.ebuild,v 1.9 2012/09/09 11:22:16 armin76 Exp $

EAPI="3"
PYTHON_DEPEND="2::2.6"

inherit distutils webapp

MY_PN="moin"

DESCRIPTION="Python WikiClone"
SRC_URI="http://static.moinmo.in/files/${MY_PN}-${PV}.tar.gz"
HOMEPAGE="http://moinmo.in/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ppc x86"
IUSE="rss"

DEPEND=""
RDEPEND=">=dev-python/docutils-0.4
	rss? ( >=dev-python/pyxml-0.8.4 )"

need_httpd_cgi

S="${WORKDIR}"/${MY_PN}-${PV}

PYTHON_MODNAME="MoinMoin"
WEBAPP_MANUAL_SLOT="yes"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
	webapp_pkg_setup
}

src_install() {
	webapp_src_preinst
	distutils_src_install

	dodoc README docs/CHANGES* docs/README.migration
	dohtml docs/INSTALL.html
	rm -rf README docs/

	cd "${D}"/usr/share/moin

	insinto "${MY_HTDOCSDIR}"
	doins -r htdocs/* server/moin.cgi
	fperms +x "${MY_HTDOCSDIR}/moin.cgi"

	insinto "${MY_HOSTROOTDIR}"/${PF}
	doins -r data underlay config/wikiconfig.py

	insinto "${MY_HOSTROOTDIR}"/${PF}/altconfigs
	doins -r config

	insinto "${MY_HOSTROOTDIR}"/${PF}/altserver
	doins -r server

	# data needs to be server owned per moin devs
	cd "${D}/${MY_HOSTROOTDIR}"/${PF}
	for file in $(find data underlay); do
		webapp_serverowned "${MY_HOSTROOTDIR}/${PF}/${file}"
	done

	webapp_configfile "${MY_HOSTROOTDIR}"/${PF}/wikiconfig.py
	webapp_hook_script "${FILESDIR}"/reconfig-3
	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt

	webapp_src_install
}

pkg_postinst() {
	ewarn
	ewarn "If you are upgrading from an older version, please read"
	ewarn "README.migration in /usr/share/doc/${PF}"
	ewarn

	distutils_pkg_postinst
	webapp_pkg_postinst
}
