# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/ssd/gentoo-x86/output/dev-util/cvs-repo/gentoo-x86/dev-util/nvidia-cuda-sdk/nvidia-cuda-sdk-2.1.1215.2015.ebuild,v 1.8 2012/02/05 05:48:44 vapier Exp $

inherit eutils unpacker toolchain-funcs

DESCRIPTION="NVIDIA CUDA Software Development Kit"
HOMEPAGE="http://developer.nvidia.com/cuda"

SRC_URI="http://developer.download.nvidia.com/compute/cuda/2_1/SDK/cuda-sdk-linux-2.10.1215.2015-3233425.run"
LICENSE="CUDPP"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug emulation"

RDEPEND=">=dev-util/nvidia-cuda-toolkit-2.1
	>=x11-drivers/nvidia-drivers-180.22
	media-libs/freeglut"
DEPEND="${RDEPEND}
	<sys-devel/gcc-4.4"

S="${WORKDIR}"
RESTRICT="binchecks"

pkg_setup() {
	if [ "$(gcc-major-version)" == "4" -a $(gcc-minor-version) -ge 4 ]; then
		eerror "This package requires <=sys-devel/gcc-4.3 to build sucessfully."
		eerror "Please use gcc-config to switch to a compatible GCC version."
		die "<=sys-devel/gcc-4.3 required"
	fi
}

src_unpack() {
	unpack_makeself
	cd "${S}"
	sed -i -e 's:CUDA_INSTALL_PATH ?= .*:CUDA_INSTALL_PATH ?= /opt/cuda:' sdk/common/common.mk
	epatch "${FILESDIR}/nvidia-cuda-sdk-2.10.1215.2015-vararg_inline_fix.patch"
}

src_compile() {
	local myopts=""

	if use emulation; then
		myopts="emu=1"
	fi

	if use debug; then
		myopts="${myopts} dbg=1"
	fi

	cd "${S}/sdk"

	MAKEOPTS="${MAKEOPTS} -j1" emake cuda-install=/opt/cuda ${myopts} || die
}

src_install() {
	cd "${S}/sdk"

	for f in $(find .); do
		local t="$(dirname ${f})"
		if [[ "${t/obj\/}" != "${t}" || "${t##*.}" == "a" ]]; then
			continue
		fi

		if [[ -x "${f}" && ! -d "${f}" ]]; then
			exeinto "/opt/cuda/sdk/$(dirname ${f})"
			doexe "${f}"
		else
			insinto "/opt/cuda/sdk/$(dirname ${f})"
			doins "${f}"
		fi
	done
}
