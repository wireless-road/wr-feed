DEVICE_VARS += UBOOT


define Build/imx6ull-ubootimg
	rm -f $@
	rm -f $@.preamble
	dd if=/dev/zero of=$@.preamble bs=1024 count=1
	cat $@.preamble $(STAGING_DIR_IMAGE)/mx6ull_wr_netsom-u-boot.imx >$@
endef

define Build/imx6ull-mtd-factory
	
	mv $@ $@.fw
	
	$(call Build/imx6ull-ubootimg)
	dd if=/dev/zero of=$@.new bs=1M count=1
	dd if=$@ of=$@.new conv=notrunc
	
	echo "ARGUMENT NAME: $@";
	
	cat $@.fw >>$@.new
	
	mv $@.new $@
	rm -f $@.new
endef

define Device/netsom-common
  PROFILES := Default
  FILESYSTEMS := squashfs
  KERNEL_NAME := zImage
  UBOOT := mx6ull_wr_netsom
  IMAGE_SIZE := 31m
  IMAGE_SIZE_FACTORY := 32m
  KERNEL_DEPENDS = $$(wildcard ../dts/$$(DEVICE_DTS).dts)
  DEVICE_DTS_DIR := ../dts
  KERNEL_LOADADDR := 0x80008000
  ARTIFACTS := u-boot.bin
  ARTIFACT/u-boot.bin := imx6ull-ubootimg
  IMAGES := sysupgrade.bin factory.bin
  IMAGE/sysupgrade.bin := append-kernel | append-rootfs | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
  IMAGE/factory.bin := append-kernel | append-rootfs | pad-rootfs | imx6ull-mtd-factory | append-metadata | check-size $$$$(IMAGE_SIZE_FACTORY)
endef

define Device/wirelessroad_netsom-evb
  DEVICE_VENDOR := WirelessRoad
  DEVICE_MODEL := NetSOM Development Board
  DEVICE_NAME := netsom-evb
  DEVICE_DTS := wr-eval-board
  $(Device/netsom-common)
  DEVICE_PACKAGES := kmod-can kmod-can-flexcan kmod-can-raw \
    kmod-sound-core kmod-sound-soc-imx6ull kmod-sound-simple-card
  KERNEL := kernel-bin | \
    fit none $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb
  KERNEL_INITRAMFS_SUFFIX := .bin
  KERNEL_INITRAMFS := kernel-bin | \
	  fit none $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb with-initrd
endef
TARGET_DEVICES += wirelessroad_netsom-evb

# define Device/wirelessroad_audio-stream-ethernet
#   DEVICE_VENDOR := WirelessRoad
#   DEVICE_MODEL := Audio Stream Ethernet 
#   DEVICE_NAME := audio-stream-ethernet
#   DEVICE_DTS := wr-eval-board
#   $(Device/netsom-common)
#   DEVICE_PACKAGES := kmod-sound-core kmod-sound-soc-imx \
# 	kmod-can kmod-can-flexcan kmod-can-raw
#   IMAGES := sysupgrade.bin
#   IMAGE/sysupgrade.bin := append-kernel | append-rootfs | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
# endef
# TARGET_DEVICES += wirelessroad_audio_stream_ethernet
