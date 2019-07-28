# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="kodi-theme-Estuary"
PKG_VERSION="1.0"
PKG_LICENSE="GPL"
PKG_SITE="http://www.kodi.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain kodi"
PKG_NEED_UNPACK="$(get_pkg_directory $MEDIACENTER)"
PKG_LONGDESC="Kodi Mediacenter default theme."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/addons/
    cp -a $(get_build_dir kodi)/.$TARGET_NAME/addons/skin.estuary $INSTALL/usr/share/kodi/addons/

#add Netflix & Retroarch shortcuts to menu. Set Live TV to first place and delete Games section for Retroarch
  if [ ! "$OEM_EMU" = "no" ]; then
    patch -d $INSTALL/usr/share/kodi/addons/skin.estuary -p1 < $PKG_DIR/files/netflix-retroarch-livetv.patch
  fi


}
