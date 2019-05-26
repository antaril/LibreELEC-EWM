# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking@gmail.com)

PKG_NAME="lr-core-info"
PKG_VERSION="d285119cd58ec28bb4332eae523ed211399e94d1"
PKG_SHA256="079b11e91f15a9efce9afa27a71622e48803aa9f24474f52ad80bd7da9a55538"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/libretro-core-info"
PKG_URL="https://github.com/libretro/libretro-core-info/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Libretro's core info files"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  cd ${PKG_BUILD}
  make install INSTALLDIR="${INSTALL}/usr/share/retroarch/coreinfo"
}
