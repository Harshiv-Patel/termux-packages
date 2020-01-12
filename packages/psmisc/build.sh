TERMUX_PKG_HOMEPAGE=https://gitlab.com/psmisc/psmisc
TERMUX_PKG_DESCRIPTION="Some small useful utilities that use the proc filesystem"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_VERSION=23.3
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://fossies.org/linux/misc/psmisc-$TERMUX_PKG_VERSION.tar.xz
TERMUX_PKG_SHA256=41750e1a5abf7ed2647b094f58127c73dbce6876f77ba4e0a7e0995ae5c7279a
TERMUX_PKG_DEPENDS="ncurses"
TERMUX_PKG_ESSENTIAL=true
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_RM_AFTER_INSTALL="bin/pstree.x11"
