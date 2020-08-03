TERMUX_PKG_HOMEPAGE=https://lldb.llvm.org
TERMUX_PKG_DESCRIPTION="LLVM based debugger"
TERMUX_PKG_LICENSE="NCSA"
TERMUX_PKG_VERSION=9.0.1
TERMUX_PKG_SRCURL=https://github.com/llvm/llvm-project/releases/download/llvmorg-$TERMUX_PKG_VERSION/lldb-$TERMUX_PKG_VERSION.src.tar.xz
TERMUX_PKG_SHA256=8a7b9fd795c31a3e3cba6ce1377a2ae5c67376d92888702ce27e26f0971beb09
TERMUX_PKG_DEPENDS="libc++, libedit, libllvm, libxml2, ncurses-ui-libs"
TERMUX_PKG_BUILD_DEPENDS="libllvm-static"
TERMUX_PKG_BREAKS="lldb-dev, lldb-static"
TERMUX_PKG_REPLACES="lldb-dev, lldb-static"
TERMUX_PKG_HAS_DEBUG=false
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DLLDB_DISABLE_CURSES=0
-DLLDB_DISABLE_LIBEDIT=0
-DLLDB_DISABLE_PYTHON=1
-DLLVM_CONFIG=$TERMUX_PREFIX/bin/llvm-config
-DLLVM_ENABLE_TERMINFO=1
-DLLVM_LINK_LLVM_DYLIB=ON
-DLLVM_DIR=$TERMUX_PREFIX/lib/cmake/llvm
-DClang_DIR=$TERMUX_PREFIX/lib/cmake/clang
-DLLVM_NATIVE_BUILD=$TERMUX_PREFIX/bin
"
termux_step_pre_configure() {
	# This will be there if libllvm was built from scratch, but not if the pre-built
	# package was extracted. Not really needed but the stupid clang CMake config makes
	# sure it's there.
	if [ ! -f "$TERMUX_PREFIX/bin/clang-offload-wrapper" ]; then
		touch $TERMUX_PREFIX/bin/clang-offload-wrapper
		touch $TERMUX_PKG_BUILDDIR/rm-fake-ci-test
	fi
	touch $TERMUX_PREFIX/bin/clang-import-test
}

termux_step_post_make_install() {
	cp $TERMUX_PKG_BUILDDIR/docs/man/lldb.1 $TERMUX_PREFIX/share/man/man1
	if [ -f "$TERMUX_PKG_BUILDDIR/rm-fake-ci-test" ]; then
		rm $TERMUX_PREFIX/bin/clang-offload-wrapper
	fi
}
