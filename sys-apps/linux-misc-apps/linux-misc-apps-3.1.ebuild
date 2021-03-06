# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/sys-apps/cvs-repo/gentoo-x86/sys-apps/linux-misc-apps/linux-misc-apps-3.1.ebuild,v 1.1 2011/11/01 09:06:05 robbat2 Exp $

EAPI=4

inherit versionator eutils toolchain-funcs linux-info

DESCRIPTION="Misc tools bundled with kernel sources"
HOMEPAGE="http://kernel.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc"
IUSE=""

MY_PV="${PV/_/-}"
MY_PV="${MY_PV/-pre/-git}"

LINUX_V=$(get_version_component_range 1-2)

if [ ${PV/_rc} != ${PV} ]; then
	LINUX_VER=$(get_version_component_range 1-2).$(($(get_version_component_range 3)-1))
	PATCH_VERSION=$(get_version_component_range 1-3)
	LINUX_PATCH=patch-${PV//_/-}.bz2
	SRC_URI="mirror://kernel/linux/kernel/v${LINUX_V}/testing/${LINUX_PATCH}
		mirror://kernel/linux/kernel/v${LINUX_V}/testing/v${PATCH_VERSION}/${LINUX_PATCH}"
elif [ $(get_version_component_count) == 4 ]; then
	# stable-release series
	LINUX_VER=$(get_version_component_range 1-3)
	LINUX_PATCH=patch-${PV}.bz2
	SRC_URI="mirror://kernel/linux/kernel/v${LINUX_V}/${LINUX_PATCH}"
else
	LINUX_VER=${PV}
fi

LINUX_SOURCES=linux-${LINUX_VER}.tar.bz2
SRC_URI="${SRC_URI} mirror://kernel/linux/kernel/v${LINUX_V}/${LINUX_SOURCES}"

RDEPEND="sys-apps/pciutils" # pciutils for cpupower
DEPEND="${RDEPEND}"

S="${WORKDIR}/linux-${LINUX_VER}"

# All of these are integrated with the kernel build system,
# No make install, and ideally build with with the root Makefile
TARGETS_SIMPLE=(
	Documentation/accounting/getdelays.c
	Documentation/cgroups/cgroup_event_listener.c
	Documentation/laptops/dslm.c
	Documentation/laptops/hpfall.c
	Documentation/networking/timestamping/timestamping.c
	Documentation/virtual/lguest/lguest.c
	Documentation/vm/page-types.c
	Documentation/watchdog/src/watchdog-simple.c
	drivers/staging/hv/tools/hv_kvp_daemon.c
	tools/slub/slabinfo.c
	usr/gen_init_cpio.c
)
# Documentation/networking/ifenslave.c - obsolete
# Documentation/ptp/testptp.c - pending linux-headers-3.0
# tools/hv/hv_kvp_daemon.c - pending linux-3.2

# These have a broken make install, no DESTDIR
TARGET_MAKE_SIMPLE=(
	tools/firewire:nosy-dump
	tools/power/x86/turbostat:turbostat
	tools/power/x86/x86_energy_perf_policy:x86_energy_perf_policy
)
# tools/perf - covered by dev-utils/perf
# tools/usb - testcases only
# tools/virtio - testcaes only

	#for _pattern in {Documentation,scripts,tools,usr,include,lib,"arch/*/include",Makefile,Kbuild,Kconfig}; do
src_unpack() {
	unpack ${LINUX_SOURCES}

	MY_A=
	for _AFILE in ${A}; do
		[[ ${_AFILE} == ${LINUX_SOURCES} ]] && continue
		[[ ${_AFILE} == ${LINUX_PATCH} ]] && continue
		MY_A="${MY_A} ${_AFILE}"
	done
	[[ -n ${MY_A} ]] && unpack ${MY_A}
}

src_prepare() {
	if [[ -n ${LINUX_PATCH} ]]; then
		epatch "${DISTDIR}"/${LINUX_PATCH}
	fi
	libs="-lcpupower -lrt -lpci"
	sed -i \
		-e "/$libs/{ s,${libs},,g; s,\$, ${libs},g;}" \
		"${S}"/tools/power/cpupower/Makefile
}

cpupower_make() {
	emake ${makeargs} \
		CC="$(tc-getCC)" AR="$(tc-getAR)" \
		docdir="/usr/share/doc/${PF}/cpupower" \
		mandir="/usr/share/man" \
		libdir="/usr/$(get_libdir)" \
		OPTIMIZATION="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}" \
		CPUFREQ_BENCH=/bin/false \
		DEBUG=/bin/false \
		STRIP=/bin/true \
		"$@" || die
}

kernel_asm_arch() {
	a="${1:${ARCH}}"
	case ${a} in
		# Merged arches
		x86|amd64) echo x86 ;;
		ppc*) echo powerpc ;;
		# Non-merged
		alpha|arm|ia64|m68k|mips|sh|sparc*) echo ${1} ;;
		*) die "TODO: Update the code for your asm-ARCH symlink" ;;
	esac
}

src_compile() {
	local karch=$(kernel_asm_arch "${ARCH}")
	# This is the minimal amount needed to start building host binaries.
	#emake allmodconfig ARCH=${karch} || die
	#emake prepare modules_prepare ARCH=${karch} || die
	#touch Module.symvers

	# Now we can start building
	for s in ${TARGETS_SIMPLE[@]} ; do
		dir=$(dirname $s) src=$(basename $s) bin=${src%.c}
		einfo "Building $s => $bin"
		emake -f /dev/null M=${dir} ARCH=${karch} ${s%.c} || die
	done

	for t in ${TARGET_MAKE_SIMPLE[@]} ; do
		einfo "Building $dir => $target"
		dir=${t/:*} target=${t/*:}
		emake -C $dir ARCH=${karch} $target || die
	done

	# cpupower is special
	einfo "Buildling cpupower"
	cd "${S}"/tools/power/cpupower
	cpupower_make ARCH=${karch} all || die
}

src_install() {
	into /usr
	for s in ${TARGETS_SIMPLE[@]} ; do
		dir=$(dirname $s) src=$(basename $s) bin=${src%.c}
		dosbin ${dir}/${bin} || die "Failed to install ${bin}"
	done

	for t in ${TARGET_MAKE_SIMPLE[@]} ; do
		dir=${t/:*} target=${t/*:}
		dosbin ${dir}/${target} || die
	done

	local karch=$(kernel_asm_arch "${ARCH}")
	cd "${S}"/tools/power/cpupower
	cpupower_make ARCH=${karch} DESTDIR="${D}" install || die
}
