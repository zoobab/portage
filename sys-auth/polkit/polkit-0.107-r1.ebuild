# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-auth/cvs-repo/gentoo-x86/sys-auth/polkit/polkit-0.107-r1.ebuild,v 1.4 2012/10/09 22:14:44 jer Exp $

EAPI=4
inherit eutils multilib pam pax-utils systemd user

DESCRIPTION="Policy framework for controlling privileges for system-wide services"
HOMEPAGE="http://www.freedesktop.org/wiki/Software/polkit"
SRC_URI="http://www.freedesktop.org/software/${PN}/releases/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="examples gtk +introspection kde nls pam selinux systemd"

RDEPEND=">=dev-lang/spidermonkey-1.8.5-r1
	>=dev-libs/glib-2.32
	>=dev-libs/expat-2
	introspection? ( >=dev-libs/gobject-introspection-1 )
	pam? (
		sys-auth/pambase
		virtual/pam
		)
	selinux? ( sec-policy/selinux-policykit )
	systemd? ( sys-apps/systemd )"
DEPEND="${RDEPEND}
	app-text/docbook-xml-dtd:4.1.2
	app-text/docbook-xsl-stylesheets
	dev-libs/libxslt
	dev-util/intltool
	virtual/pkgconfig"
PDEPEND="
	gtk? ( || (
		>=gnome-extra/polkit-gnome-0.105
		lxde-base/lxpolkit
		) )
	kde? ( sys-auth/polkit-kde-agent )
	pam? (
		systemd? ( sys-auth/pambase[systemd] )
		!systemd? ( sys-auth/pambase[consolekit] )
		)
	!systemd? ( >=sys-auth/consolekit-0.4.5_p2012[policykit] )"

pkg_setup() {
	local u=polkitd
	local g=polkitd
	local h=/var/lib/polkit-1

	enewgroup ${g}
	enewuser ${u} -1 -1 ${h} ${g}
	esethome ${u} ${h}
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-fallback.patch
	sed -i -e 's|unix-group:wheel|unix-user:0|' src/polkitbackend/*-default.rules || die #401513
	has_version ">=dev-lang/spidermonkey-1.8.7" && { sed -i -e '/mozjs/s:185:187:g' configure || die; }
}

src_configure() {
	econf \
		--localstatedir="${EPREFIX}"/var \
		--disable-static \
		--enable-man-pages \
		--disable-gtk-doc \
		$(use_enable systemd libsystemd-login) \
		$(use_enable introspection) \
		--disable-examples \
		$(use_enable nls) \
		"$(systemd_with_unitdir)" \
		--with-authfw=$(usex pam pam shadow) \
		$(use pam && echo --with-pam-module-dir="$(getpam_mod_dir)") \
		--with-os-type=gentoo
}

src_compile() {
	default

	# Required for polkitd on hardened/PaX due to spidermonkey's JIT
	local f='src/polkitbackend/.libs/polkitd test/polkitbackend/.libs/polkitbackendjsauthoritytest'
	if has_version '>=dev-lang/spidermonkey-1.8.7[jit]'; then
		pax-mark m ${f}
	else
		pax-mark mr ${f}
	fi
}

src_install() {
	if has multilib-strict ${FEATURES}; then
		ewarn
		ewarn "Possible broken flag multilib-strict in FEATURES detected."
		ewarn "Your build will likely fail to install wrt bug #424423."
		ewarn "This is a bug in the Package Manager instead of polkit."
		ewarn
	fi

	emake DESTDIR="${D}" install

	dodoc docs/TODO HACKING NEWS README

	fowners -R polkitd:root /{etc,usr/share}/polkit-1/rules.d

	diropts -m0700 -o polkitd -g polkitd
	keepdir /var/lib/polkit-1

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins src/examples/{*.c,*.policy*}
	fi

	prune_libtool_files
}

pkg_postinst() {
	chown -R polkitd:root "${EROOT}"/{etc,usr/share}/polkit-1/rules.d
	chown -R polkitd:polkitd "${EROOT}"/var/lib/polkit-1
}
