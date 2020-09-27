TERMUX_PKG_HOMEPAGE=http://gondor.apana.org.au/~herbert/dash/
TERMUX_PKG_DESCRIPTION="Small POSIX-compliant implementation of /bin/sh"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_VERSION=0.5.11.2
TERMUX_PKG_REVISION=4
TERMUX_PKG_SRCURL=http://gondor.apana.org.au/~herbert/dash/files/dash-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=3c663919dc5c66ec991da14c7cf7e0be8ad00f3db73986a987c118862b5f6071
TERMUX_PKG_ESSENTIAL=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--disable-static"

termux_step_pre_configure() {
	# Prefix verification patch should be applied only for the
	# builds with original prefix.
	if [ "$TERMUX_PREFIX" = "/data/data/com.termux/files/usr" ]; then
		patch -p1 -i $TERMUX_PKG_BUILDER_DIR/verify-prefix.patch.txt
	fi
}

termux_step_post_make_install() {
	# Symlink sh -> dash
	ln -sfr $TERMUX_PREFIX/bin/{dash,sh}
	ln -sfr $TERMUX_PREFIX/share/man/man1/{dash,sh}.1
}
