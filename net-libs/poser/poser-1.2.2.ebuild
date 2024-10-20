# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="a C framework for POsix SERvices"
HOMEPAGE="https://github.com/Zirias/poser"
SRC_URI="https://github.com/Zirias/${PN}/releases/download/v${PV}/${P}.tar.xz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	#emake PREFIX="${EPREFIX}"
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr libdir="${EPREFIX}/usr/$(get_libdir)"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr libdir="${EPREFIX}/usr/$(get_libdir)" install
}
