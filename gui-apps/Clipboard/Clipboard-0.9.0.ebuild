# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# TODO: add IUSE to enable X/wayland?

inherit cmake

DESCRIPTION="clipboard tool for the terminal"
HOMEPAGE="https://github.com/Slackadays/Clipboard"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/Slackadays/Clipboard.git"
else
	MY_PV=${PV/_p/r}
	MY_P=${P/_p/r}
	S=${WORKDIR}/${PN}-${MY_PV}
	SRC_URI="https://github.com/Slackadays/Clipboard/archive/refs/tags/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
	)
	cmake_src_configure
}

src_prepare() {
	sed -i -e 's/LIBRARY DESTINATION lib/LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/' src/cbx11/CMakeLists.txt || die
	sed -i -e 's/LIBRARY DESTINATION lib/LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/' src/cbwayland/CMakeLists.txt || die

	cmake_src_prepare
}

src_install() {
	cmake_src_install

	newman - cb.1 <<<".so clipboard.1"
}
