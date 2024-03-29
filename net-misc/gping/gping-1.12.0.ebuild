# Copyright 2017-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.0.1
	android_system_properties@0.1.5
	anstream@0.3.2
	anstyle@1.0.0
	anstyle-parse@0.2.0
	anstyle-query@1.0.0
	anstyle-wincon@1.0.1
	anyhow@1.0.71
	autocfg@1.1.0
	bitflags@1.3.2
	bumpalo@3.13.0
	cassowary@0.3.0
	cc@1.0.79
	cfg-if@1.0.0
	chrono@0.4.24
	clap@4.3.0
	clap_builder@4.3.0
	clap_derive@4.3.0
	clap_lex@0.5.0
	colorchoice@1.0.0
	const_fn@0.4.9
	const_format@0.2.30
	const_format_proc_macros@0.2.29
	core-foundation-sys@0.8.4
	crossterm@0.26.1
	crossterm_winapi@0.9.0
	dns-lookup@2.0.2
	either@1.8.1
	errno@0.3.1
	errno-dragonfly@0.1.2
	form_urlencoded@1.1.0
	git2@0.16.1
	heck@0.4.1
	hermit-abi@0.3.1
	iana-time-zone@0.1.56
	iana-time-zone-haiku@0.1.2
	idna@0.3.0
	io-lifetimes@1.0.11
	is-terminal@0.4.7
	is_debug@1.0.1
	itertools@0.10.5
	itoa@1.0.6
	jobserver@0.1.26
	js-sys@0.3.63
	lazy_static@1.4.0
	libc@0.2.144
	libgit2-sys@0.14.2+1.5.1
	libz-sys@1.1.9
	linux-raw-sys@0.3.8
	lock_api@0.4.9
	log@0.4.17
	memchr@2.5.0
	mio@0.8.6
	num-integer@0.1.45
	num-traits@0.2.15
	num_threads@0.1.6
	once_cell@1.17.1
	parking_lot@0.12.1
	parking_lot_core@0.9.7
	percent-encoding@2.2.0
	pinger@0.11.0
	pkg-config@0.3.27
	proc-macro2@1.0.58
	quote@1.0.27
	ratatui@0.20.1
	read_color@1.0.0
	redox_syscall@0.2.16
	regex@1.8.2
	regex-syntax@0.7.2
	rustix@0.37.19
	scopeguard@1.1.0
	serde@1.0.163
	shadow-rs@0.21.0
	signal-hook@0.3.15
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.1
	smallvec@1.10.0
	socket2@0.5.3
	static_assertions@1.1.0
	strsim@0.10.0
	syn@2.0.16
	thiserror@1.0.40
	thiserror-impl@1.0.40
	time@0.1.45
	time@0.3.21
	time-core@0.1.1
	time-macros@0.2.9
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tz-rs@0.6.14
	tzdb@0.5.7
	unicode-bidi@0.3.13
	unicode-ident@1.0.8
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	unicode-width@0.1.10
	unicode-xid@0.2.4
	url@2.3.1
	utf8parse@0.2.1
	vcpkg@0.2.15
	wasi@0.10.0+wasi-snapshot-preview1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.86
	wasm-bindgen-backend@0.2.86
	wasm-bindgen-macro@0.2.86
	wasm-bindgen-macro-support@0.2.86
	wasm-bindgen-shared@0.2.86
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi_forked_icmpapi@0.3.7
	windows@0.48.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-targets@0.42.2
	windows-targets@0.48.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.0
	winping@0.10.1
	${P}
"

inherit cargo

DESCRIPTION="Ping, but with a graph"

HOMEPAGE="
	https://github.com/orf/gping
	https://crates.io/crates/gping
"
SRC_URI="${CARGO_CRATE_URIS}"
RESTRICT="mirror"

LICENSE="Apache-2.0 BSD-2 MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
