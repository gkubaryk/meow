# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Tools making SSH more convenient"
HOMEPAGE="https://github.com/vaporup/ssh-tools"
if [[ ${PV} == *9999* ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/vaporup/ssh-tools.git"
else
	SRC_URI="https://github.com/vaporup/ssh-tools/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	#wait til it's actually released
	#KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	app-shells/bash
	sys-apps/coreutils
	virtual/ssh"

src_install() {
	dobin ssh-*
}
