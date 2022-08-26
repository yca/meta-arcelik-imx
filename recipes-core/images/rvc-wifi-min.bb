SUMMARY = "RVC minimal WIFI enabled image"

LICENSE = "MIT"

inherit core-image

IMAGE_FEATURES += "ssh-server-dropbear tools-debug debug-tweaks"

CORE_IMAGE_EXTRA_INSTALL += "sysbench memtester"

CORE_IMAGE_EXTRA_INSTALL += "ethtool evtest i2c-tools"

IMAGE_INSTALL_append = " wpa-supplicant \
	dhcp-client \
	iw \
	linux-firmware-bcm43430 \
	"
