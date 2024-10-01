# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="plain X11 emoji keyboard"
HOMEPAGE="https://github.com/Zirias/xmoji"
SRC_URI="https://github.com/Zirias/${PN}/releases/download/v${PV}/${P}.tar.xz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="media-libs/fontconfig
media-libs/freetype
>=media-libs/libpng-1.6:=
x11-libs/libxcb
x11-libs/libxkbcommon
x11-libs/xcb-util-cursor"
RDEPEND="${DEPEND}"
BDEPEND=">=net-libs/poser-1.2"

src_compile() {
	export PKG_CONFIG_PATH="/usr/lib/pkgconfig"
	emake BUNDLED_POSER=off
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install
}
