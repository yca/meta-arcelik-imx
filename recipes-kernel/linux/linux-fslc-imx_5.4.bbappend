DESCRIPTION = "Linux kernel suppporting Arcelik boards."

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI_remove = "file://defconfig"
SRC_URI += " \
	   file://0001-arm-imx-add-clock-disable-hack.patch \
	   file://imx8mn-arcelik-rvc.dts;subdir=git/arch/arm64/boot/dts/freescale \
           file://arcelik_imx8mn_rvc_defconfig;subdir=git/arch/arm64/configs \
"

KBUILD_DEFCONFIG ?= "arcelik_imx8mn_rvc_defconfig"
