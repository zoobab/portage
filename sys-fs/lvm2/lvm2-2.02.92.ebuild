# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-fs/cvs-repo/gentoo-x86/sys-fs/lvm2/lvm2-2.02.92.ebuild,v 1.4 2012/05/04 19:09:16 jdhore Exp $

EAPI=3
inherit eutils multilib toolchain-funcs autotools linux-info

DESCRIPTION="User-land utilities for LVM2 (device-mapper) software."
HOMEPAGE="http://sources.redhat.com/lvm2/"
SRC_URI="ftp://sources.redhat.com/pub/lvm2/${PN/lvm/LVM}.${PV}.tgz
		 ftp://sources.redhat.com/pub/lvm2/old/${PN/lvm/LVM}.${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-linux"

IUSE="readline +static +static-libs clvm cman +lvm1 selinux"

DEPEND_COMMON="!!sys-fs/device-mapper
	readline? ( sys-libs/readline )
	clvm? ( =sys-cluster/dlm-2*
			cman? ( =sys-cluster/cman-2* ) )
	>=sys-fs/udev-151-r4"

RDEPEND="${DEPEND_COMMON}
	!<sys-apps/openrc-0.4
	!!sys-fs/lvm-user
	!!sys-fs/clvm
	>=sys-apps/util-linux-2.16"

# Upgrading to this LVM will break older cryptsetup
RDEPEND="${RDEPEND}
		!<sys-fs/cryptsetup-1.1.2"

DEPEND="${DEPEND_COMMON}
		virtual/pkgconfig
		>=sys-devel/binutils-2.20.1-r1
		static? ( || ( >=sys-fs/udev-181[static-libs] <sys-fs/udev-181 ) )"

S="${WORKDIR}/${PN/lvm/LVM}.${PV}"

pkg_setup() {
	local CONFIG_CHECK="~SYSVIPC"
	local WARNING_SYSVIPC="CONFIG_SYSVIPC:\tis not set (required for udev sync)\n"
	check_extra_config
	# 1. Genkernel no longer copies /sbin/lvm blindly.
	# 2. There are no longer any linking deps in /usr.
	if use static; then
		elog "Warning, we no longer overwrite /sbin/lvm and /sbin/dmsetup with"
		elog "their static versions. If you need the static binaries,"
		elog "you must append .static to the filename!"
	fi
}

src_unpack() {
	unpack ${A}
}

src_prepare() {
	epatch "${FILESDIR}"/lvm.conf-2.02.67.patch

	# Should not be needed due to upstream re-arrangement of build
	#epatch "${FILESDIR}"/${PN}-2.02.56-dmeventd.patch
	# Should not be need with new upstream udev rules
	#epatch "${FILESDIR}"/${PN}-2.02.56-device-mapper-export-format.patch

	# Merged upstream:
	#epatch "${FILESDIR}"/${PN}-2.02.51-as-needed.patch
	# Merged upstream:
	#epatch "${FILESDIR}"/${PN}-2.02.48-fix-pkgconfig.patch
	# Merged upstream:
	#epatch "${FILESDIR}"/${PN}-2.02.51-fix-pvcreate.patch
	# Fixed differently upstream:
	#epatch "${FILESDIR}"/${PN}-2.02.51-dmsetup-selinux-linking-fix-r3.patch

	epatch "${FILESDIR}"/${PN}-2.02.63-always-make-static-libdm.patch
	epatch "${FILESDIR}"/lvm2-2.02.56-lvm2create_initrd.patch
	# bug 318513
	epatch "${FILESDIR}"/${PN}-2.02.64-dmeventd-libs.patch
	# bug 301331
	epatch "${FILESDIR}"/${PN}-2.02.67-createinitrd.patch
	# bug 330373
	epatch "${FILESDIR}"/${PN}-2.02.92-locale-muck.patch
	# --as-needed
	epatch "${FILESDIR}"/${PN}-2.02.70-asneeded.patch
	# bug 332905
	epatch "${FILESDIR}"/${PN}-2.02.92-dynamic-static-ldflags.patch
	# bug 361429 - merged upstream in .85
	#epatch "${FILESDIR}"/${PN}-2.02.84-udev-pkgconfig.patch

	# Merged upstream
	#epatch "${FILESDIR}"/${PN}-2.02.73-asneeded.patch

	epatch "${FILESDIR}"/${PN}-2.02.88-respect-cc.patch

	eautoreconf
}

src_configure() {
	local myconf
	local buildmode

	myconf="${myconf} --enable-dmeventd"
	myconf="${myconf} --enable-cmdlib"
	myconf="${myconf} --enable-applib"
	myconf="${myconf} --enable-fsadm"
	#myconf="${myconf} --enable-lvmetad" # Not ready yet

	# Most of this package does weird stuff.
	# The build options are tristate, and --without is NOT supported
	# options: 'none', 'internal', 'shared'
	if use static ; then
		einfo "Building static LVM, for usage inside genkernel"
		buildmode="internal"
		# This only causes the .static versions to become available
		# For recent systems, there are no linkages against anything in /usr anyway.
		# We explicitly provide the .static versions so that they can be included in
		# initramfs environments.
		myconf="${myconf} --enable-static_link"
	else
		ewarn "Building shared LVM, it will not work inside genkernel!"
		buildmode="shared"
	fi

	# dmeventd requires mirrors to be internal, and snapshot available
	# so we cannot disable them
	myconf="${myconf} --with-mirrors=internal"
	myconf="${myconf} --with-snapshots=internal"
	myconf="${myconf} --with-thin=internal"

	if use lvm1 ; then
		myconf="${myconf} --with-lvm1=${buildmode}"
	else
		myconf="${myconf} --with-lvm1=none"
	fi

	# disable O_DIRECT support on hppa, breaks pv detection (#99532)
	use hppa && myconf="${myconf} --disable-o_direct"

	if use clvm; then
		myconf="${myconf} --with-cluster=${buildmode}"
		# 4-state! Make sure we get it right, per bug 210879
		# Valid options are: none, cman, gulm, all
		#
		# 2009/02:
		# gulm is removed now, now dual-state:
		# cman, none
		# all still exists, but is not needed
		#
		# 2009/07:
		# TODO: add corosync and re-enable ALL
		local clvmd=""
		use cman && clvmd="cman"
		#clvmd="${clvmd/cmangulm/all}"
		[ -z "${clvmd}" ] && clvmd="none"
		myconf="${myconf} --with-clvmd=${clvmd}"
		myconf="${myconf} --with-pool=${buildmode}"
	else
		myconf="${myconf} --with-clvmd=none --with-cluster=none"
	fi

	myconf="${myconf}
			--with-dmeventd-path=/sbin/dmeventd"
	econf $(use_enable readline) \
		$(use_enable selinux) \
		--enable-pkgconfig \
		--with-confdir="${EPREFIX}/etc" \
		--sbindir="${EPREFIX}/sbin" \
		--with-staticdir="${EPREFIX}/sbin" \
		--libdir="${EPREFIX}/$(get_libdir)" \
		--with-usrlibdir="${EPREFIX}/usr/$(get_libdir)" \
		--enable-udev_rules \
		--enable-udev_sync \
		--with-udevdir="${EPREFIX}/lib/udev/rules.d/" \
		${myconf} \
		CLDFLAGS="${LDFLAGS}" || die
}

src_compile() {
	einfo "Doing symlinks"
	pushd include
	emake || die "Failed to prepare symlinks"
	popd

	einfo "Starting main build"
	emake || die "compile fail"
}

src_install() {
	emake DESTDIR="${D}" install || die "Failed to emake install"

	dodoc README VERSION* WHATS_NEW WHATS_NEW_DM doc/*.{conf,c,txt}
	insinto /$(get_libdir)/rcscripts/addons
	newins "${FILESDIR}"/lvm2-start.sh-2.02.67-r1 lvm-start.sh || die
	newins "${FILESDIR}"/lvm2-stop.sh-2.02.67-r1 lvm-stop.sh || die
	newinitd "${FILESDIR}"/lvm.rc-2.02.67-r1 lvm || die
	newinitd "${FILESDIR}"/lvm-monitoring.initd-2.02.67-r2 lvm-monitoring || die
	newconfd "${FILESDIR}"/lvm.confd-2.02.28-r2 lvm || die
	if use clvm; then
		newinitd "${FILESDIR}"/clvmd.rc-2.02.39 clvmd || die
		newconfd "${FILESDIR}"/clvmd.confd-2.02.39 clvmd || die
	fi

	# move shared libs to /lib(64)
	if use static-libs; then
		dolib.a libdm/ioctl/libdevmapper.a || die "dolib.a libdevmapper.a"
		#gen_usr_ldscript libdevmapper.so
	fi

	dosbin "${S}"/scripts/lvm2create_initrd/lvm2create_initrd
	doman  "${S}"/scripts/lvm2create_initrd/lvm2create_initrd.8
	newdoc "${S}"/scripts/lvm2create_initrd/README README.lvm2create_initrd

	insinto /etc
	doins "${FILESDIR}"/dmtab
	insinto /$(get_libdir)/rcscripts/addons
	doins "${FILESDIR}"/dm-start.sh

	# Device mapper stuff
	newinitd "${FILESDIR}"/device-mapper.rc-2.02.67-r1 device-mapper || die
	newconfd "${FILESDIR}"/device-mapper.conf-1.02.22-r3 device-mapper || die

	newinitd "${FILESDIR}"/dmeventd.initd-2.02.67-r1 dmeventd || die
	if use static-libs; then
		dolib.a daemons/dmeventd/libdevmapper-event.a \
		|| die "dolib.a libdevmapper-event.a"
		#gen_usr_ldscript libdevmapper-event.so
	fi

	use static-libs || \
	rm -f "${D}"/usr/$(get_libdir)/{libdevmapper-event,liblvm2cmd,liblvm2app,libdevmapper}.a

	#insinto /etc/udev/rules.d/
	#newins "${FILESDIR}"/64-device-mapper.rules-2.02.56-r3 64-device-mapper.rules || die

	# do not rely on /lib -> /libXX link
	sed -e "s-/lib/rcscripts/-/$(get_libdir)/rcscripts/-" -i "${ED}"/etc/init.d/*

	elog "USE flag nocman is deprecated and replaced"
	elog "with the cman USE flag."
	elog ""
	elog "USE flags clvm and cman are masked"
	elog "by default and need to be unmasked to be used"
	elog ""
	elog "If you are using genkernel and root-on-LVM, rebuild the initramfs."
}

pkg_postinst() {
	elog "lvm volumes are no longer automatically created for"
	elog "baselayout-2 users. If you are using baselayout-2, be sure to"
	elog "run: # rc-update add lvm boot"
	elog "Do NOT add it if you are still using baselayout-1."
}

src_test() {
	einfo "Testcases disabled because of device-node mucking"
	einfo "If you want them, compile the package and see ${S}/tests"
}
