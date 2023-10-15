# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic toolchain-funcs

DESCRIPTION="multi base interactive calculator for bit manipulation"
HOMEPAGE="https://github.com/mellowcandle/bitwise"
MY_P="${PN}-v${PV}"
SRC_URI="https://github.com/mellowcandle/bitwise/releases/download/v${PV}/${MY_P}.tar.gz"
S="${WORKDIR}"/${MY_P}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sys-libs/ncurses:0=
	sys-libs/readline:="
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_configure() {
	append-libs "$($(tc-getPKG_CONFIG) --libs ncurses)"

	econf
}
