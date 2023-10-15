# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# adopted from https://raw.githubusercontent.com/gentoo-mirror/sattvik/master/app-backup/acts/acts-1.4.2.ebuild
#
EAPI=8

DESCRIPTION="Another Calendar-based Tarsnap Script"
HOMEPAGE="https://github.com/alexjurkiewicz/acts"
SRC_URI="https://github.com/alexjurkiewicz/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="app-backup/tarsnap"
DEPEND=""

src_compile() {
	true;
}

src_install() {
	dobin acts
	dodoc acts.conf.sample README.md
	docinto "contrib"
	dodoc contrib/acts-pre.sh contrib/acts-post.sh
	docompress -x /usr/share/doc/${PF}/contrib
}

pkg_postinst() {
	if [ ! -f "${EROOT}/etc/acts.conf" ]; then
		ewarn "You must configure ACTS by creating a configuration in:"
		ewarn "  ${EPREFIX}/etc/acts.conf"
		ewarn ""
		ewarn "A sample configuration has been installed to"
		ewarn "  ${EPREFIX}/usr/share/doc/${PF}/acts.conf.sample"
	fi
}
