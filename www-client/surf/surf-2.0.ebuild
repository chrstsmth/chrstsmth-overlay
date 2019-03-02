# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3 toolchain-funcs

DESCRIPTION="a simple web browser based on WebKit/GTK+"
HOMEPAGE="https://surf.suckless.org/"

EGIT_REPO_URI="https://github.com/chrstsmth/surf.git"
EGIT_BRANCH="chrstsmth/chrstsmth-overlay"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

COMMON_DEPEND="
	dev-libs/glib:2
	net-libs/libsoup
	net-libs/webkit-gtk:4
	x11-libs/gtk+:3
	x11-libs/libX11
"
DEPEND="
	${COMMON_DEPEND}
	virtual/pkgconfig
"
RDEPEND="
	!sci-chemistry/surf
	${COMMON_DEPEND}

	net-misc/curl
	x11-apps/xprop
	x11-misc/dmenu
	x11-terms/st
"

src_prepare() {
	default

	tc-export CC PKG_CONFIG
}

src_install() {
	default
}

pkg_postinst() {
	if [[ ${REPLACING_VERSIONS} ]] && [[ ${REPLACING_VERSIONS} < 0.4.1-r1 ]]; then
		ewarn "Please correct the permissions of your \$HOME/.surf/ directory"
		ewarn "and its contents to no longer be world readable (see bug #404983)"
	fi
}
