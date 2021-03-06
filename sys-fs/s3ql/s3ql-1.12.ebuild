# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-fs/cvs-repo/gentoo-x86/sys-fs/s3ql/s3ql-1.12.ebuild,v 1.1 2012/09/04 07:57:34 radhermit Exp $

EAPI="4"

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils

DESCRIPTION="A full-featured file system for online data storage"
HOMEPAGE="http://code.google.com/p/s3ql/"
SRC_URI="http://s3ql.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="contrib doc test"

RDEPEND="dev-python/setuptools
	>=dev-python/apsw-3.7.0
	>=dev-python/llfuse-0.37
	dev-python/pycryptopp
	dev-python/pyliblzma
	|| ( >=dev-lang/python-2.7 dev-python/argparse )
	sys-fs/fuse"
DEPEND="${RDEPEND}
	test? (
		net-misc/rsync[xattr]
		dev-python/unittest2
	)"

src_test() {
	if [[ ${EUID} -ne 0 ]] ; then
		ewarn "Skipping tests: root privileges are required so userpriv must be disabled"
	else
		addwrite /dev/fuse
		distutils_src_test
	fi
}

src_install() {
	distutils_src_install

	if use contrib ; then
		exeinto /usr/share/doc/${PF}/contrib
		docompress -x /usr/share/doc/${PF}/contrib
		doexe contrib/*.{py,sh}
		doman contrib/*.1
	fi

	if use doc ; then
		dodoc doc/manual.pdf
		dohtml -r doc/html/*
	fi
}
