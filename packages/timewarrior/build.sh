TERMUX_PKG_HOMEPAGE=https://taskwarrior.org/docs/timewarrior/
TERMUX_PKG_DESCRIPTION="Command-line time tracker"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_VERSION=1.1.1
TERMUX_PKG_REVISION=6
TERMUX_PKG_SRCURL=https://taskwarrior.org/download/timew-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=1f7d9a62e55fc5a3126433654ccb1fd7d2d135f06f05697f871897c9db77ccc9
TERMUX_PKG_DEPENDS="libandroid-glob, libc++"

termux_step_post_get_source() {
	rmdir src/libshared
	mv libshared-${_LIBSHARED_COMMIT}/ src/libshared
}

termux_step_pre_configure() {
	LDFLAGS+=" -landroid-glob"
}

