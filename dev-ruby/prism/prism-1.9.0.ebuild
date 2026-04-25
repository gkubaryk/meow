# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34 ruby40"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTENSIONS=( ext/prism/extconf.rb )
RUBY_FAKEGEM_EXTENSION_LIBDIR="lib/prism"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md docs/*"
RUBY_FAKEGEM_GEMSPEC="prism.gemspec"
RUBY_FAKEGEM_RECIPE_DOC="none"

inherit dot-a ruby-fakegem toolchain-funcs

DESCRIPTION="Prism Ruby parser"
HOMEPAGE="https://github.com/ruby/prism"
SRC_URI="https://github.com/ruby/prism/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~arm64-macos ~x64-macos ~x64-solaris"

ruby_add_bdepend "dev-ruby/bundler"

all_ruby_prepare() {
	# Avoid a dependency on rake-compiler
	sed -e '/PRISM_FFI_BACKEND/ s/$/ and false/' \
		-i Rakefile || die

	# Avoid a test that won't work reliably in our varied build environments.
	sed -e '/test_prism_so_exports_only_the_C_extension_init_function/aomit "Not reliable on Gentoo."' \
		-i test/prism/library_symbols_test.rb || die
}

each_ruby_prepare() {
	# rake imports all rakelib/* (bug #947054)
	rm rakelib/rdoc.rake || die
	${RUBY} -S rake templates || die
}

all_ruby_compile() {
	all_fakegem_compile

	# https://github.com/ruby/prism/blob/main/docs/build_system.md
	# The fakegem side handles the Ruby extension but we want to provide
	# the parser library itself too. libprism.a gets built twice but
	# in different configurations (with symbols exported for the general
	# library).
	#
	# (No ${RUBY} here as anything will do.)
	rake templates || die

	tc-export AR CC
	lto-guarantee-fat
	# 'all' builds a .so too which we don't currently want
	emake V=1 static
}

all_ruby_install() {
	all_fakegem_install

	strip-lto-bytecode build/libprism.a

	doheader -r include/prism{,.h}
	dolib.a build/libprism.a
	# No SONAME and I doubt it has a stable ABI
	#dolib.so build/libprism.so
}