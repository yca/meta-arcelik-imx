DESCRIPTION = "i.MX U-Boot suppporting Arcelik boards."

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRCBRANCH = "yca/rvc-v1"
SRC_URI = "git://github.com/yca/uboot-imx.git;protocol=https;branch=${SRCBRANCH} \
           file://bl31.bin;subdir=build \
           file://ddr4_dmem_1d.bin;subdir=build \
           file://ddr4_dmem_2d.bin;subdir=build \
           file://ddr4_imem_1d.bin;subdir=build \
           file://ddr4_imem_2d.bin;subdir=build \
"
SRCREV = "${AUTOREV}"

DEPENDS += " xxd-native"

EXTRA_OEMAKE_append = " ATF_LOAD_ADDR=0x960000"

UBOOT_MAKE_TARGET_mx8 = "flash.bin"
UBOOT_BINARY = "flash.bin"
