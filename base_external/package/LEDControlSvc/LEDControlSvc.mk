
##############################################################
#
# LEDControlSvc
#
##############################################################

LEDCONTROLSVC_VERSION = 'efb2859df4e891fe287bc9354c57e0d1f38a6d7a'
LEDCONTROLSVC_SITE = 'git@github.com:cu-ecen-5013/final-project-solnus.git'
LEDCONTROLSVC_SITE_METHOD = git
LEDCONTROLSVC_GIT_SUBMODULES = YES
LEDCONTROLSVC_DEPENDENCIES = host-scons

define LEDCONTROLSVC_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) TOOLCHAIN=$(shell echo $(TARGET_CROSS) | sed 's/.$$//') -C $(@D) all
endef

define LEDCONTROLSVC_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/src/AzureSrc/device-start-stop $(TARGET_DIR)/etc/init.d/S99iotdevice
	$(INSTALL) -m 0755 $(@D)/build/LEDControlSvc $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/src/AzureSrc/SendCloudToDeviceMessage.py $(TARGET_DIR)/usr/bin/

endef

$(eval $(generic-package))
