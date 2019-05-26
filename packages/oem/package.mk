# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Frank Hartung (supervisedthinking@gmail.com)

PKG_NAME="oem"
PKG_VERSION="1.0"
PKG_LICENSE="various"
PKG_SITE="http://www.libreelec.tv"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="oem"
PKG_LONGDESC="OEM: Metapackage for various OEM packages"
PKG_TOOLCHAIN="manual"


# Common emulators included in all images
OEM_EMU_COMMON=" \
  retroarch "



# Install common & specific tools
if [ "${OEM_APPS}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_APPS_COMMON}"
  case ${PROJECT} in
    Amlogic_Legacy)
      PKG_DEPENDS_TARGET+=" ${OEM_APPS_AMLOGIC_LEGACY}"
      ;;
    Generic)
      PKG_DEPENDS_TARGET+=" ${OEM_APPS_GENERIC}"
      ;;
    Rockchip)
      PKG_DEPENDS_TARGET+=" ${OEM_APPS_ROCKCHIP}"
      ;;
    RPi*)
      PKG_DEPENDS_TARGET+=" ${OEM_APPS_RPI}"
      ;;
  esac
fi

# Install common & specific emulators
if [ "${OEM_EMU}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_EMU_COMMON}"
  case ${PROJECT} in
    Amlogic_Legacy)
      PKG_DEPENDS_TARGET+=" ${OEM_EMU_AMLOGIC_LEGACY}"
      ;;
    Generic)
      PKG_DEPENDS_TARGET+=" ${OEM_EMU_GENERIC}"
      ;;
   Rockchip)
      PKG_DEPENDS_TARGET+=" ${OEM_EMU_ROCKCHIP}"
      ;;
    RPi*)
      PKG_DEPENDS_TARGET+=" ${OEM_EMU_RPI}"
      ;;
  esac
fi

makeinstall_target() {
  # Create dirs
  mkdir -p ${INSTALL}

  # Copy oem config files & scripts
  cp -PRv ${PKG_DIR}/files/common/*     ${INSTALL}
  cp -PRv ${PKG_DIR}/files/${PROJECT}/* ${INSTALL}
}
