# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="calculate the phase of moon"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

src_prepare() {
	cp "${FILESDIR}"/${PN}.c "${WORKDIR}"
	default
}

src_compile() {
	emake LDLIBS="-lm" "${WORKDIR}"/${PN}
}

src_install() {
	dobin ${PN}
}
