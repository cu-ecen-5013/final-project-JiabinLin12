
##############################################################
#
# LEDControlSvc
#
##############################################################

LEDCONTROLSVC_VERSION = 'ee08ea06c5f40d4be2002b2295f8682bda7875ff'
LEDCONTROLSVC_SITE = 'git@github.com:cu-ecen-5013/final-project-solnus.git'
LEDCONTROLSVC_SITE_METHOD = git
LEDCONTROLSVC_GIT_SUBMODULES = YES

define LEDCONTROLSVC_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define LEDCONTROLSVC_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/build/LEDControlSvc $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
