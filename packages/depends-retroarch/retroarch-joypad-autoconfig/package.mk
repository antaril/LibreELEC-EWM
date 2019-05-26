# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking@gmail.com)

PKG_NAME="retroarch-joypad-autoconfig"
PKG_VERSION="5b6e463c5defea48e64a21b22785eec334881a7d"
PKG_SHA256="da660aa4d12bebbba1c1a9c7623c85087eeb72e57a189098f6dd79d9d65ba8cd"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/retroarch-joypad-autoconfig"
PKG_URL="https://github.com/libretro/retroarch-joypad-autoconfig/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="RetroArch joypad autoconfig files"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  cd ${PKG_BUILD}
  make install INSTALLDIR="${INSTALL}/usr/share/retroarch/autoconfig"
}

post_makeinstall_target () {
  cp -av ${PKG_DIR}/config/* ${INSTALL}/usr/share/retroarch/autoconfig
}
