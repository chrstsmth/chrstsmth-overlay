# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit savedconfig toolchain-funcs

DESCRIPTION="Simple generic tabbed fronted to xembed aware applications"
HOMEPAGE="https://tools.suckless.org/tabbed"

EGIT_REPO_URI="https://github.com/chrstsmth/tabbed.git"
EGIT_BRANCH="chrstsmth/chrstsmth-overlay"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/libX11"
DEPEND="
	x11-base/xorg-proto
	${RDEPEND}
"

src_compile() {
	emake CC=$(tc-getCC)
}
src_install() {
	default
	save_config config.h
}
