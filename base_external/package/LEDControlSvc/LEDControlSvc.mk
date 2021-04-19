
##############################################################
#
# LEDControlSvc
#
##############################################################

LEDCONTROLSVC_VERSION = '9410cafe6e1289f2f845f184ee01d8cb84ab0ec1'
LEDCONTROLSVC_SITE = 'git@github.com:cu-ecen-5013/final-project-solnus.git'
#LEDCONTROLSVC_SITE = '/home/solnus/class/ext/final-project-solnus/'
LEDCONTROLSVC_SITE_METHOD = git
LEDCONTROLSVC_GIT_SUBMODULES = YES
LEDCONTROLSVC_DEPENDENCIES = host-scons

AZURE_DEVICE_NAME = "ecen5713-iot-edge"
AZURE_DEVICE_KEY = "sVDMKlFJsDETVlACDeH4iav64ks+5ejIw/kTvSag354="

#AZURE_DEVICE_NAME = "LEDControlSvc1"
#AZURE_DEVICE_KEY = "+CzAplnvSW39SBSX+GOvZZMk4xhjdBRSBo4JQ+pkDUw="

define LEDCONTROLSVC_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) TOOLCHAIN=$(shell echo $(TARGET_CROSS) | sed 's/.$$//') -C $(@D) AZURE_DEVICE_KEY=\"$(AZURE_DEVICE_KEY)\" AZURE_DEVICE_NAME=\"$(AZURE_DEVICE_NAME)\" all
endef

define LEDCONTROLSVC_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/usr/bin
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc
	$(INSTALL) -m 0755 $(@D)/device-start-stop $(TARGET_DIR)/etc/init.d/S99iotdevice
	$(INSTALL) -m 0755 $(@D)/build/LEDControlSvc $(TARGET_DIR)/usr/bin/
	echo -e "devname = \"$(AZURE_DEVICE_NAME)\";" > $(@D)/build/LEDControlSvc.conf
	echo -e "key = \"$(AZURE_DEVICE_KEY)\";" >> $(@D)/build/LEDControlSvc.conf
	$(INSTALL) -m 0700 $(@D)/build/LEDControlSvc.conf $(TARGET_DIR)/etc/
endef

$(eval $(generic-package))
