
##############################################################
#
# LDD Kernel Modules
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = 'ab600037d66277a7a1bd59baff6493b966218236'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-thurtt.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

define LDD_BUILD_CMDS
	$(MAKE) -C $(@D)/scull KERNELDIR=$(LINUX_DIR) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)"
	$(MAKE) -C $(@D)/misc-modules KERNELDIR=$(LINUX_DIR) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)"
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull.ko $(TARGET_DIR)/lib/modules/$(BR2_LINUX_KERNEL_VERSION)/
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/lib/modules/$(BR2_LINUX_KERNEL_VERSION)/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/lib/modules/$(BR2_LINUX_KERNEL_VERSION)/
	$(INSTALL) -m 0755 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/lib/modules/$(BR2_LINUX_KERNEL_VERSION)/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/lib/modules/$(BR2_LINUX_KERNEL_VERSION)/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/lib/modules/$(BR2_LINUX_KERNEL_VERSION)/
	$(INSTALL) -m 0755 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/lib/modules/$(BR2_LINUX_KERNEL_VERSION)/
endef

$(eval $(generic-package))
