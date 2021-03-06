# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/app-forensics/cvs-repo/gentoo-x86/app-forensics/openscap/openscap-0.8.2.ebuild,v 1.1 2012/05/22 20:51:55 hwoarang Exp $

EAPI=3

PYTHON_DEPEND="2"

inherit eutils multilib python bash-completion-r1

DESCRIPTION="Framework which enables integration with the Security Content Automation Protocol (SCAP)"
HOMEPAGE="http://www.open-scap.org/"
SRC_URI="https://fedorahosted.org/releases/o/p/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bash-completion doc nss perl python rpm selinux sql test"
#RESTRICT="test"

RDEPEND="!nss? ( dev-libs/libgcrypt )
	nss? ( dev-libs/nss )
	rpm? ( >=app-arch/rpm-4.9 )
	sql? ( dev-db/opendbx )
	dev-libs/libpcre
	dev-libs/libxml2
	dev-libs/libxslt
	net-misc/curl"
DEPEND="${RDEPEND}
	perl? ( dev-lang/swig )
	python? ( dev-lang/swig )
	test? (
		app-arch/unzip
		net-misc/ipcalc
		sys-apps/grep )"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	sed -i 's/uname -p/uname -m/' tests/probes/uname/test_probes_uname.xml.sh || die
	sed -i 's,/etc/rc.d/init.d,/etc/init.d,' src/OVAL/probes/unix/runlevel.c || die
	#problem sent upstream  https://fedorahosted.org/openscap/ticket/45
	sed -i 's,unzip,\$1,' tests/test_common.sh || die
	#problem sent upstream https://fedorahosted.org/openscap/ticket/46
	epatch ${FILESDIR}/test_probes_interface.patch || die
	# runlevel isnt supported on gentoo
	sed -i 's,probecheck "runlevel,probecheck "runlevellllll,' tests/probes/runlevel/test_probes_runlevel.sh || die
	#According to comment of theses tests, we must modify it. For the moment disable it
	sed -i 's,.*linux-def_inetlisteningservers_test,#&,' tests/mitre/test_mitre.sh || die
	sed -i 's,.*ind-def_environmentvariable_test,#&,' tests/mitre/test_mitre.sh || die
	#This test fail when testing process with [] in names https://fedorahosted.org/openscap/ticket/47
	epatch ${FILESDIR}/test_probes_process.patch || die

	if ! use rpm ; then
		sed -i 's,probe_rpminfo_req_deps_ok=yes,probe_rpminfo_req_deps_ok=no,' configure || die
		sed -i 's,probe_rpminfo_opt_deps_ok=yes,probe_rpminfo_opt_deps_ok=no,' configure || die
		sed -i 's,probe_rpmverify_req_deps_ok=yes,probe_rpmverify_req_deps_ok=no,' configure || die
		sed -i 's,probe_rpmverify_opt_deps_ok=yes,probe_rpmverify_opt_deps_ok=no,' configure || die
		sed -i 's,^probe_rpm.*_deps_missing=,&disabled by USE flag,' configure || die
		sed -i 's,.*rpm.*,#&,' tests/mitre/test_mitre.sh || die
	fi
	if ! use selinux ; then
		sed -i 's,.*selinux.*,#&,' tests/mitre/test_mitre.sh || die
	fi
}

src_configure() {
	local myconf
	if use python || use perl ; then
		myconf+=" --enable-bindings"
	else
		myconf+=" --disable-bindings"
	fi
	if use nss ; then
		myconf+=" --with-crypto=nss3"
	else
		myconf+=" --with-crypto=gcrypt"
	fi
	econf ${myconf}
}

src_install() {
	emake install DESTDIR="${D}" || die
	find "${D}" -name '*.la' -delete || die
	sed -i 's/^Description/&:/' "${D}"/usr/$(get_libdir)/pkgconfig/libopenscap.pc || die
	#--enable-bindings enable all bindings, clean unwanted bindings
	if use python && ! use perl ; then
		rm -rf "${D}"/usr/$(get_libdir)/perl5 || die
	fi
	if ! use python && use perl ; then
		rm -rf "${D}"/$(python_get_sitedir) || die
	fi
	if use doc ; then
		dohtml -r docs/html/* || die
		dodoc docs/examples/* || die
	fi
	if use bash-completion ; then
		dobashcomp "${D}"/etc/bash_completion.d/oscap
	fi
	rm -rf "${D}"/etc/bash_completion.d || die
}
