#
# Copyright (C) 2023 Sergey Moryakov <sergey@nqnet.org>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=canneloni
PKG_VERSION:=1.1.0
PKG_RELEASE:=1
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mguentner/cannelloni.git
PKG_SOURCE_DATE:=2023-04-02
PKG_SOURCE_VERSION:=3d4fb8c8b07f6d7c62b2bdad7e5a94de61c9a29b
PKG_MIRROR_HASH:=91d5dc7f80e69f203967f3ae274138bb026ed7dc503b566c57cbf7a202f9b

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/cannelloni
	SECTION:=WR CAN
	CATEGORY:=WR CAN
	DEPENDS:=+libstdcpp
	TITLE:=Cannelloni
	MAINTAINER:=Sergey Moryakov <sergey@nqnet.org>
endef

define Package/cannelloni/description
	Cannelloni SocketCAN over ethernet tunnel
endef

CMAKE_OPTIONS +=\
	-DCMAKE_BUILD_TYPE=Release \
	-DSCTP_SUPPORT=false

define Package/cannelloni/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cannelloni $(1)/usr/sbin/canneloni
	${INSTALL_DIR} $(1)/usr/lib
	${INSTALL_BIN} $(PKG_BUILD_DIR)/libcannelloni-common.so.0.0.1 $(1)/usr/lib/
	${LN} libcannelloni-common.so.0.0.1 $(1)/usr/lib/libcannelloni-common.so.0
	${LN} libcannelloni-common.so.0 $(1)/usr/lib/libcannelloni-common.so
endef

$(eval $(call BuildPackage,cannelloni))

