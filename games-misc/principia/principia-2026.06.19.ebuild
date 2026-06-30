# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="open sourced physics-based sandbox game"
HOMEPAGE="https://principia-web.se/"
SRC_URI="https://github.com/Bithack/principia/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
if [[ ${PV} == *9999* ]]; then
        inherit git-r3

        EGIT_REPO_URI="https://github.com/Bithack/principia.git"
else
	KEYWORDS="~amd64"
fi

DEPEND="media-libs/freetype:2
	media-libs/libjpeg-turbo
	media-libs/libpng
	media-libs/libsdl3
	x11-libs/gtk+:3"
RDEPEND="${DEPEND}"
BDEPEND=""
