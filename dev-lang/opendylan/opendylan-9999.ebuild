# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-lang/cvs-repo/gentoo-x86/dev-lang/opendylan/opendylan-9999.ebuild,v 1.3 2012/08/22 03:42:00 patrick Exp $
EAPI=4

inherit autotools git-2

RESTRICT="test"

DESCRIPTION="OpenDylan language runtime environment"

HOMEPAGE="http://opendylan.org"
EGIT_HAS_SUBMODULES="1"
EGIT_REPO_URI="https://github.com/dylan-lang/opendylan.git"

LICENSE="Opendylan"
SLOT="0"

IUSE=""

DEPEND="dev-libs/boehm-gc[threads]
	dev-lang/perl
	dev-perl/XML-Parser
	|| ( dev-lang/opendylan-bin dev-lang/opendylan )"
RDEPEND="${DEPEND}"

src_prepare() {
	mkdir -p build-aux
	elibtoolize && eaclocal || die "Fail"
	automake --foreign --add-missing # this one dies wrongfully
	eautoconf || die "Fail"
}

src_configure() {
	if has_version =dev-lang/opendylan-bin-2011.1; then
		PATH=/opt/opendylan-2011.1/bin/:$PATH
        else
                PATH=/opt/opendylan/bin/:$PATH
	fi
	econf --prefix=/opt/opendylan || die
}

src_compile() {
	ulimit -s 32000 # this is naughty build system
	emake || die
}

src_install() {
	ulimit -s 32000 # this is naughty build system
	# because of Makefile weirdness it rebuilds quite a bit here
	# upstream has been notified
	emake -j1 DESTDIR=${D} install
	mkdir -p "${D}/etc/env.d/opendylan/"
	echo "export PATH=/opt/opendylan/bin:\$PATH" > "${D}/etc/env.d/opendylan/opendylan" || die "Failed to add env settings"
}
