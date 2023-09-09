#
# Copyright (C) 2013-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_VERSION:=2022.01
PKG_RELEASE:=5
NAME:=WirelesseRoad NetSOM
PKG_HASH:=81b4543227db228c03f8a1bf5ddbc813b0bb8f6555ce46064ef721a6fc680413

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=wr_imx6ull
  UBOOT_IMAGE:=u-boot.imx
endef

define U-Boot/mx6ull_wr_netsom
  NAME:=WirelesseRoad NetSOM
  UBOOT_IMAGE:=u-boot.imx
  UBOOT_MAKE_FLAGS+=u-boot.imx
  BUILD_SUBTARGET:=netsom
  BUILD_DEVICES:=wirelessroad_netsom-evb
endef

UBOOT_TARGETS := \
	mx6ull_wr_netsom

UBOOT_MAKE_FLAGS += u-boot.imx

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(foreach img,$(UBOOT_IMAGE), \
		$(CP) $(PKG_BUILD_DIR)/$(img) $(STAGING_DIR_IMAGE)/$(BUILD_VARIANT)-$(img); \
	)
endef

$(eval $(call BuildPackage/U-Boot))
