# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-python/cvs-repo/gentoo-x86/dev-python/rst2pdf/rst2pdf-0.91.ebuild,v 1.1 2012/05/12 01:47:06 rafaelmartins Exp $

EAPI="4"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython"

inherit distutils

DESCRIPTION="Tool for transforming reStructuredText to PDF using ReportLab"
HOMEPAGE="http://code.google.com/p/rst2pdf/ http://pypi.python.org/pypi/rst2pdf"
SRC_URI="http://rst2pdf.googlecode.com/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/docutils
	dev-python/imaging
	dev-python/pygments
	>=dev-python/reportlab-2.4"
RDEPEND="${DEPEND}"

DOCS="Contributors.txt CHANGES.txt README.txt doc/*"

pkg_postinst() {
	distutils_pkg_postinst

	elog "rst2pdf can work with the following packages for additional functionality:"
	elog "   dev-python/sphinx       - versatile documentation creation"
	elog "   dev-python/pythonmagick - image processing with ImageMagick"
	elog "   dev-python/matplotlib   - mathematical formulae"
	elog "   media-gfx/uniconvertor  - vector image format conversion"
	elog "It can also use wordaxe for hyphenation, but this package is not"
	elog "available in the portage tree yet. Please refer to the manual"
	elog "installed in /usr/share/doc/${PF}/ for more information."
}
