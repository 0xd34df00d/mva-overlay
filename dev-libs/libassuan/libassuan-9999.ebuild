# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 eutils autotools

DESCRIPTION="IPC library used by GnuPG and GPGME"
HOMEPAGE="http://www.gnupg.org/related_software/libassuan/index.en.html"
SRC_URI=""
EGIT_REPO_URI="git://git.gnupg.org/libassuan.git"
#EGIT_BOOTSTRAP="./autogen.sh"
#SRC_URI="mirror://gnupg/${PN}/${P}.tar.bz2"

LICENSE="GPL-3 LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="static-libs"

RDEPEND=">=dev-libs/libgpg-error-1.8"
DEPEND="${RDEPEND}"

DOCS=( AUTHORS ChangeLog NEWS README THANKS TODO )

#S="${WORKDIR}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static) --enable-maintainer-mode
}

src_install() {
	default
	# ppl need to use libassuan-config for --cflags and --libs
	rm -f "${ED}"usr/lib*/${PN}.la
}
