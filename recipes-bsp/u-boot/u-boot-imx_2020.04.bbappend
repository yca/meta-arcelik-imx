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

do_deploy_append_mx8n() {
    # Deploy the mkimage, u-boot-nodtb.bin and fsl-imx8m*-XX.dtb for mkimage to generate boot binary
    if [ -n "${UBOOT_CONFIG}" ]
    then
        for config in ${UBOOT_MACHINE}; do
            i=$(expr $i + 1);
            for type in ${UBOOT_CONFIG}; do
                j=$(expr $j + 1);
                if [ $j -eq $i ]
                then
                    install -d ${DEPLOYDIR}/${BOOT_TOOLS}
                    install -m 0777 ${B}/${config}/arch/arm/dts/${UBOOT_DTB_NAME}  ${DEPLOYDIR}/${BOOT_TOOLS}
                    install -m 0777 ${B}/${config}/u-boot-nodtb.bin  ${DEPLOYDIR}/${BOOT_TOOLS}/u-boot-nodtb.bin-${MACHINE}-${UBOOT_CONFIG}
                fi
            done
            unset  j
        done
        unset  i
    fi
}
