# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2013-2014 OpenWrt.org

include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=wr-imx6ull
BOARDNAME:=WirelessRoad Devices with i.MX6ULL NetSOM
FEATURES:=audio fpu gpio rtc usb usbgadget squashfs ramdisk
SUBTARGETS:=netsom

KERNEL_PATCHVER:=5.15

include $(INCLUDE_DIR)/target.mk

KERNELNAME:=zImage dtbs

DEFAULT_PACKAGES += uboot-envtools mkf2fs e2fsprogs blkid

$(eval $(call BuildTarget))
