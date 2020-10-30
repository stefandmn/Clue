PKG_NAME="rust"
PKG_VERSION="1.39.0"
PKG_LICENSE="MIT"
PKG_SITE="https://www.rust-lang.org"
PKG_DEPENDS_TARGET="toolchain rustup.rs"
PKG_LONGDESC="A systems programming language that prevents segfaults, and guarantees thread safety."
PKG_TOOLCHAIN="manual"

make_target() {
  export CARGO_HOME="$PKG_BUILD/cargo"
  export RUSTUP_HOME="$CARGO_HOME"
  export PATH="$CARGO_HOME/bin:$PATH"

  RUST_TARGET_TRIPLE="arm-unknown-linux-gnueabihf"

  "$(get_build_dir rustup.rs)/rustup-init.sh" \
    --default-toolchain "$PKG_VERSION" \
    --no-modify-path \
    --profile minimal \
    --target "$RUST_TARGET_TRIPLE" \
    -y

  cat <<EOF >"$CARGO_HOME/config"
[build]
target = "$RUST_TARGET_TRIPLE"

[target.$RUST_TARGET_TRIPLE]
ar = "$AR"
linker = "$CC"
EOF

  cat <<EOF >"$CARGO_HOME/env"
export CARGO_HOME="$CARGO_HOME"
export CARGO_TARGET_DIR="\$PKG_BUILD/.\$TARGET_NAME"
export PATH="$CARGO_HOME/bin:$PATH"
export PKG_CONFIG_ALLOW_CROSS="1"
export PKG_CONFIG_PATH="$PKG_CONFIG_LIBDIR"
export RUSTUP_HOME="$CARGO_HOME"
unset CFLAGS
EOF
}
