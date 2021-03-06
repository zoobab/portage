# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-nds/cvs-repo/gentoo-x86/net-nds/389-ds-base/389-ds-base-1.2.11.15.ebuild,v 1.2 2012/10/02 20:25:09 lxnay Exp $

EAPI=2

WANT_AUTOMAKE="1.9"
MY_P=${P/_alpha/.a}
MY_P=${MY_P/_rc/.rc}
inherit user eutils multilib flag-o-matic autotools

DESCRIPTION="389 Directory Server (core librares and daemons )"
HOMEPAGE="http://port389.org/"
SRC_URI="http://directory.fedoraproject.org/sources/${MY_P}.tar.bz2"

LICENSE="GPL-2-with-exceptions"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="autobind auto-dn-suffix debug doc +pam-passthru +dna +ldapi +bitwise +presence kerberos selinux"

ALL_DEPEND="!>=sys-libs/db-5.0
	>=dev-libs/cyrus-sasl-2.1.19
	>=dev-libs/icu-3.4
	dev-libs/nss[utils]
	dev-libs/nspr
	dev-libs/svrcore
	dev-libs/openssl
	dev-libs/libpcre:3
	dev-libs/mozldap
	dev-perl/perl-mozldap
	>=net-analyzer/net-snmp-5.1.2
	sys-apps/tcp-wrappers
	>=sys-libs/db-4.5
	sys-libs/pam
	sys-libs/zlib
	kerberos? ( net-nds/openldap >=app-crypt/mit-krb5-1.7-r100[openldap] )
	selinux? ( >=sys-apps/policycoreutils-1.30.30
		sec-policy/selinux-base-policy )"

DEPEND="${ALL_DEPEND}
	virtual/pkgconfig
	sys-devel/libtool
	doc? ( app-doc/doxygen )
	selinux? ( sys-devel/m4 >=sys-apps/checkpolicy-1.30.12 )
	sys-apps/sed"
RDEPEND="${ALL_DEPEND}
	virtual/perl-Time-Local
	virtual/perl-MIME-Base64"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	enewgroup dirsrv
	enewuser dirsrv -1 -1 -1 dirsrv
}

src_prepare() {
	epatch "${FILESDIR}/selinux.patch"
	# Fix compilation against mozldap
	epatch "${FILESDIR}/389-ds-base-1.2.11-fix-mozldap.patch"
	# Upstream patch, will be in 1.2.11.16, fixes CVE-2012-4450
	epatch "${FILESDIR}/389-ds-base-1.2.11.16-cve-2012-4450.patch"

	# as per 389 documentation, when 64bit, export USE_64
	use amd64 && export USE_64=1

	sed -i -e 's/nobody/dirsrv/g' configure.ac || die "sed failed on configure.ac"
	eautoreconf

	# enable nsslapd-allow-unauthenticated-binds by default
	sed -i '/^nsslapd-allow-unauthenticated-binds/ s/off/on/' "${S}"/ldap/ldif/template-dse.ldif.in || \
		die "cannot tweak default setting: nsslapd-allow-unauthenticated-binds"

}

src_configure() {
	local myconf=""

	use auto-dn-suffix && myconf="${myconf} --enable-auto-dn-suffix"
	use selinux && myconf="${myconf} --with-selinux"

	econf \
		$(use_enable debug) \
		$(use_enable pam-passthru) \
		$(use_enable ldapi) \
		$(use_enable autobind) \
		$(use_enable dna) \
		$(use_enable bitwise) \
		$(use_enable presence) \
		$(use_with kerberos) \
		--enable-maintainer-mode \
		--enable-autobind \
		--with-fhs \
		$myconf || die "econf failed"
}

src_compile() {
	append-lfs-flags

	# Use -j1 otherwise libacl-plugin.so could fail to install properly
	emake -j1 || die "compile failed"
	if use selinux; then
		emake -f selinux/Makefile || die " build selinux policy failed"
	fi
}

src_install () {
	# Use -j1 otherwise libacl-plugin.so could fail to install properly
	emake -j1 DESTDIR="${D}" install || die "emake install failed"

	if use selinux;then
		emake -f selinux/Makefile DESTDIR="${D}" install || die "Install selinux policy failed"
	fi

	# install not installed header
	insinto /usr/include/dirsrv
	doins ldap/servers/slapd/slapi-plugin.h

	# for build free-ipa require winsync-plugin
	doins ldap/servers/plugins/replication/winsync-plugin.h
	doins ldap/servers/plugins/replication/repl-session-plugin.h

	# make sure perl scripts have a proper shebang
	cd "${D}"/usr/share/dirsrv/script-templates/

	for i in $(find ./  -iname '*.pl') ;do
		sed -i -e 's/#{{PERL-EXEC}}/#\!\/usr\/bin\/perl/' $i || die
	done

	# remove redhat style init script
	rm -rf "${D}"/etc/rc.d || die
	rm -rf "${D}"/etc/default || die

	# and install gentoo style init script
	newinitd "${FILESDIR}"/389-ds.initd 389-ds
	newinitd "${FILESDIR}"/389-ds-snmp.initd 389-ds-snmp

	# install Gentoo-specific start/stop scripts
	rm -f "${D}"/usr/sbin/{re,}start-dirsrv || die "cannot remove 389 start/stop executables"
	exeinto /usr/sbin
	doexe "${FILESDIR}"/{re,}start-dirsrv

	# cope with libraries being in /usr/lib/dirsrv
	dodir /etc/env.d
	echo "LDPATH=/usr/$(get_libdir)/dirsrv" > "${D}"/etc/env.d/08dirsrv

	# create the directory where our log file and database
	diropts -m 0755
	dodir /var/lib/dirsrv
	keepdir /var/lib/dirsrv
	dodir /var/lock/dirsrv
	keepdir /var/lock/dirsrv
	# snmp agent, required directory
	keepdir /var/agentx
	dodir /var/agentx

	if use doc; then
		cd "${S}"
		doxygen slapi.doxy || die "cannot run doxygen"
		dohtml -r docs/html
	fi
}

pkg_postinst() {
	if use selinux; then
		if has "loadpolicy" $FEATURES; then
			einfo "Inserting the following modules into the module store"
			cd /usr/share/selinux/targeted # struct policy not supported
			semodule -s dirsrv -i dirsrv.pp
		else
			elog
			elog "Policy has not been loaded.  It is strongly suggested"
			elog "that the policy be loaded before continuing!!"
			elog
			elog "Automatic policy loading can be enabled by adding"
			elog "\"loadpolicy\" to the FEATURES in make.conf."
			elog
			ebeep 4
		fi
	fi

	elog
	elog "If you are planning to use 389-ds-snmp (ldap-agent),"
	elog "make sure to properly configure: /etc/dirsrv/config/ldap-agent.conf"
	elog "adding proper 'server' entries, and adding the lines below to"
	elog " => /etc/snmp/snmpd.conf"
	elog
	elog "master agentx"
	elog "agentXSocket /var/agentx/master"
	elog
	elog
	elog "To start 389 Directory Server (LDAP service) at boot:"
	elog
	elog "    rc-update add 389-ds default"
	elog

	elog "If you are upgrading from previous 1.2.6 release candidates"
	elog "please see:"
	elog "http://directory.fedoraproject.org/wiki/Subtree_Rename#warning:_upgrade_from_389_v1.2.6_.28a.3F.2C_rc1_.7E_rc6.29_to_v1.2.6_rc6_or_newer"
	elog

}
