define KernelPackage/can-flexcan
  TITLE:=Support for Freescale FLEXCAN based chips
  KCONFIG:=CONFIG_CAN_FLEXCAN
  FILES:=$(LINUX_DIR)/drivers/net/can/flexcan.ko
  AUTOLOAD:=$(call AutoProbe,flexcan)
  $(call AddDepends/can)
endef

define KernelPackage/can-flexcan/description
 Freescale FLEXCAN CAN bus controller implementation.
endef

$(eval $(call KernelPackage,can-flexcan))


define KernelPackage/sound-codec-wm8960
  SUBMENU:=$(SOUND_MENU)
  TITLE:=Support for Wolfson Electronics WM8960 codec
  KCONFIG:=CONFIG_SND_SOC_WM8960
  FILES:=$(LINUX_DIR)/sound/soc/codecs/snd-soc-wm8960.ko
  DEPENDS:=+kmod-sound-soc-core +kmod-regmap-i2c
  AUTOLOAD:=$(call AutoProbe,snd-soc-wm8960)
  $(call AddDepends/sound)
endef

define KernelPackage/sound-codec-wm8960/description
 Wolfson Electronics WM8960 codec
endef

$(eval $(call KernelPackage,sound-codec-wm8960))

define KernelPackage/sound-soc-imx6ull
  TITLE:=IMX6ULL SoC support
  KCONFIG:=\
	CONFIG_SND_IMX_SOC \
	CONFIG_SND_SOC_IMX_AUDMUX \
	CONFIG_SND_SOC_FSL_SAI \
	CONFIG_SND_SOC_IMX_PCM_DMA \
  CONFIG_SND_SOC_FSL_ASOC_CARD \
  CONFIG_SND_SIMPLE_CARD
  FILES:= \
	$(LINUX_DIR)/sound/soc/fsl/snd-soc-imx-audmux.ko \
	$(LINUX_DIR)/sound/soc/fsl/snd-soc-fsl-sai.ko \
	$(LINUX_DIR)/sound/soc/fsl/imx-pcm-dma.ko \
  $(LINUX_DIR)/sound/soc/fsl/snd-soc-fsl-asoc-card.ko \
  $(LINUX_DIR)/sound/soc/generic/snd-soc-simple-card.ko \
  $(LINUX_DIR)/sound/soc/generic/snd-soc-simple-card-utils.ko
  DEPENDS:=+kmod-sound-soc-core
  AUTOLOAD:=$(call AutoLoad,56,snd-soc-imx-audmux snd-soc-fsl-sai snd-soc-imx-pcm snd-soc-fsl-asoc-card)
  $(call AddDepends/sound)
endef

define KernelPackage/sound-soc-imx/description
 Support for i.MX6ULL Platform sound (sai/audmux/pcm)
endef

$(eval $(call KernelPackage,sound-soc-imx6ull))