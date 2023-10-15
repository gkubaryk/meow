# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Tools making SSH more convenient"
HOMEPAGE="https://github.com/vaporup/ssh-tools"
SRC_URI="https://github.com/vaporup/ssh-tools/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-shells/bash
	sys-apps/coreutils
	virtual/ssh"

src_install() {
	dobin ssh-*
}
