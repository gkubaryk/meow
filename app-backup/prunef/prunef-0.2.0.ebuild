# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="takes a list of backup names and returns a list of backups for deletion"
HOMEPAGE="https://git.sr.ht/~apreiml/prunef"
if [[ ${PV} == *9999* ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://git.sr.ht/~apreiml/prunef"
else
	SRC_URI="https://git.sr.ht/~apreiml/prunef/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

S=${WORKDIR}/${PN}-v${PV}
PREFIX="${EPREFIX}/usr"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="app-text/scdoc"

src_compile() {
	emake PREFIX="${EPREFIX}/usr"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
