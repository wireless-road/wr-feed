#
# Copyright (C) 2023 Sergey Moryakov <sergey@nqnet.org>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=canopenlinux
PKG_VERSION:=4.0
PKG_RELEASE:=1
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/CANopenNode/CANopenLinux.git
PKG_SOURCE_DATE:=2021-05-06
PKG_SOURCE_VERSION:=87cfbac52bc67809be20ca03ef3533293e7f7c3a
PKG_MIRROR_HASH:=4543b44f7a7466f4e94f6c40d23779040d8dacd01f14337fd5f2a8f995a6f54e

include $(INCLUDE_DIR)/package.mk

define Package/canopenlinux
	SECTION:=WR CAN
	CATEGORY:=WR CAN
	DEPENDS:=
	TITLE:=CANopenLinux
	MAINTAINER:=Sergey Moryakov <sergey@nqnet.org>
endef

define Package/canopenlinux/description
	CANopenLinux is a CANopen stack running on Linux devices.
endef


define Package/canopenlinux/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/canopend $(1)/usr/sbin/canoprnd
endef

$(eval $(call BuildPackage,canopenlinux))
