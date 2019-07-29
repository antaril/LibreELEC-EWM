# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-stella"
PKG_VERSION="b0b63615fc2c7a30470fc1ac31ffdc18fdf4518b"
PKG_SHA256="feb04743c81d8b17b49024ee4ea9e9c85ef7826be08d809db4c3f3f372a265e4"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/stella-libretro"
PKG_URL="https://github.com/libretro/stella-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Port of Stella to libretro."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="stella_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
