
##############################################################
#
# LEDControlSvc
#
##############################################################

LED_CONTROL_SVC_VERSION = 'ee08ea06c5f40d4be2002b2295f8682bda7875ff'
LED_CONTROL_SVC_SITE = 'git@github.com:cu-ecen-5013/final-project-solnus.git'
LED_CONTROL_SVC_SITE_METHOD = git
LED_CONTROL_SVC_GIT_SUBMODULES = YES

define LED_CONTROL_SVC_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define LED_CONTROL_SVC_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/build/LEDControlSvc $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
