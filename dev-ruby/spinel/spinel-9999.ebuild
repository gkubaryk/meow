# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34 ruby40"

DESCRIPTION="Spinel compiles Ruby source code into standalone native executables"
HOMEPAGE="https://github.com/matz/spinel"
if [[ ${PV} == *9999* ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/matz/spinel.git"
else
	MY_PV=${PV/_p/r} # do we still need this
	MY_P=${P/_p/r}
	S=${WORKDIR}/${PN}-${MY_PV}
	SRC_URI="https://github.com/matz/spinel/archive/refs/tags/${MY_PV}.tar.gz -> ${MY_P}.tar.gz" # TODO, no releases yet
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-ruby/prism"

src_compile() {
	local emakeopts=(
		PRISM_LIB="${EPREFIX}/usr/$(get_libdir)/libprism.a"
	)

	emake "${emakeopts[@]}"
}

# this seems gross but the official makefile is grosser at the time of this writing
src_install() {
	dobin spinel{,_codegen,_parse}
	dolib.a lib/libspinel_rt.a
	doheader lib/sp_{bigint,runtime}.h
}
