# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="retroarch-joypad-autoconfig"
PKG_VERSION="9e77673e118d52a998072e3dcab1499e9b106df2"
PKG_SHA256="7cb25fbcdf5a17c328e45d5512c5dec534db01dbaee1df717f6f969381dc0248"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/retroarch-joypad-autoconfig.git"
PKG_URL="https://github.com/libretro/retroarch-joypad-autoconfig/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="RetroArch joypad autoconfig files"
PKG_TOOLCHAIN="manual"

post_unpack() {
  rm $PKG_BUILD/configure $PKG_BUILD/Makefile
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/retroarch/autoconfig
  cp -r * $INSTALL/usr/share/retroarch/autoconfig
}

post_makeinstall_target () {
  cp -r $PKG_DIR/config/* $INSTALL/usr/share/retroarch/autoconfig
}
