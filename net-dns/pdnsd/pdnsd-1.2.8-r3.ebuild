# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/net-dns/cvs-repo/gentoo-x86/net-dns/pdnsd/pdnsd-1.2.8-r3.ebuild,v 1.2 2012/06/14 02:20:57 zmedico Exp $

EAPI="2"

inherit user

DESCRIPTION="Proxy DNS server with permanent caching"
HOMEPAGE="http://www.phys.uu.nl/~rombouts/pdnsd.html"
SRC_URI="http://www.phys.uu.nl/~rombouts/pdnsd/releases/${P}-par.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="alpha amd64 arm ~ia64 ppc s390 sparc x86"
IUSE="debug ipv6 isdn +urandom test"

RDEPEND=""
DEPEND="test? ( net-dns/bind-tools )"

pkg_setup() {
	enewgroup pdnsd
	enewuser pdnsd -1 -1 /var/lib/pdnsd pdnsd
}

src_configure() {
	local myconf=""
	use debug && myconf="${myconf} --with-debug=3"
	use urandom && myconf="${myconf} --with-random-device=/dev/urandom"

	econf \
		--disable-dependency-tracking \
		--sysconfdir=/etc/pdnsd \
		--with-cachedir=/var/cache/pdnsd \
		--with-default-id=pdnsd \
		$(use_enable ipv6) $(use_enable ipv6 ipv6-startup) \
		$(use_enable isdn) \
		${myconf} \
		|| die "bad configure"
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"

	dodoc AUTHORS ChangeLog* NEWS README THANKS TODO README.par || die
	docinto contrib ; dodoc contrib/{README,dhcp2pdnsd,pdnsd_dhcp.pl} || die
	docinto html ; dohtml doc/html/* || die
	docinto txt ; dodoc doc/txt/* || die
	newdoc doc/pdnsd.conf pdnsd.conf.sample || die

	newinitd "${FILESDIR}/pdnsd.rc6.1" pdnsd || die
	newinitd "${FILESDIR}/pdnsd.online" pdnsd-online || die

	mkdir "${T}"/confd

	cat - > "${T}"/confd/pdnsd-online <<EOF
# Enter the interface that connects you to the dns servers
# This will correspond to /etc/init.d/net.\${IFACE}
#
# IMPORTANT: Be sure to run depscan.sh after modifiying the
# IFACE variable
IFACE=ppp0
EOF

	# Don't try to do the smart thing and add the --help output here:
	# it will cause the file to be etc-updated if the help text
	# changes and fails when cross-compiling.
	cat - > "${T}"/confd/pdnsd <<EOF
# Command line options, check pdnsd --help for a list of valid
# parameters. Note that most of the options that can be given at
# command-line are also available as configuration parameters in
# /etc/pdnsd/pdnsd.conf
PDNSDCONFIG=""
EOF

	doconfd "${T}"/confd/* || die

	# gentoo resolvconf support
	exeinto /etc/resolvconf/update.d
	newexe "${FILESDIR}/pdnsd.resolvconf-r1" pdnsd
}

src_test() {
	fail_kill() {
		kill -9 $(<"${T}"/pid)
		die "$1"
	}

	mkdir "${T}/pdnsd"
	echo -n -e "pd12\0\0\0\0" > "${T}/pdnsd/pdnsd.cache"
	IPS=$(grep ^nameserver /etc/resolv.conf | sed -e 's/nameserver \(.*\)/\tip=\1;/g' | xargs)
	sed -e "s/\tip=/${IPS}/" -e "s:cache_dir=:cache_dir=${T}/pdnsd:" "${FILESDIR}/pdnsd.conf.test" \
		> "${T}/pdnsd.conf.test"
	src/pdnsd -c "${T}/pdnsd.conf.test" -g -s -d -p "${T}/pid" || die "couldn't start daemon"
	sleep 3

	find "${T}" -ls
	[ -s "${T}/pid" ] || die "empty or no pid file created"
	[ -S "${T}/pdnsd/pdnsd.status" ] || fail_kill "no socket created"
	src/pdnsd-ctl/pdnsd-ctl -c "${T}/pdnsd" server all up || fail_kill "failed to start the daemon"
	src/pdnsd-ctl/pdnsd-ctl -c "${T}/pdnsd" status || fail_kill "failed to communicate with the daemon"
	sleep 3

	dig @127.0.0.1 -p 33455 localhost > "${T}"/dig.output 2>&1
	cat "${T}"/dig.output
	fgrep -q "status: NOERROR" "${T}"/dig.output || fail_kill "www.gentoo.org lookup failed"

	kill $(<"${T}/pid") || fail_kill "failed to terminate daemon"
}

pkg_postinst() {
	elog
	elog "Add pdnsd to your default runlevel - rc-update add pdnsd default"
	elog ""
	elog "Add pdnsd-online to your online runlevel."
	elog "The online interface will be listed in /etc/conf.d/pdnsd-online"
	elog ""
	elog "Sample config file in /etc/pdnsd/pdnsd.conf.sample"
}
