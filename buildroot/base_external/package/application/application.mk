
##############################################################
#
# APPLICATION
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = '#COMMIT VERSION NUMBER'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
APPLICATION_SITE = '#GITHUB REPOSITORY LINK'
APPLICATION_SITE_METHOD = git
APPLICATION_GIT_SUBMODULES = YES

define APPLICATION_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef


define APPLICATION_INSTALL_TARGET_CMDS
	
endef

$(eval $(generic-package))
