DESCRIPTION = "Linux kernel suppporting Arcelik boards."

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI_remove = "file://defconfig"
SRC_URI += " \
           file://uart-clk-do-not-disable.patch \
           file://arcelik_imx8mn_rvc_defconfig;subdir=git/arch/arm64/configs \
"

KBUILD_DEFCONFIG ?= "arcelik_imx8mn_rvc_defconfig"
