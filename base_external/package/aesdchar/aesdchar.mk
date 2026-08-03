
##############################################################
#
# LDD Kernel Modules
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESDCHAR_VERSION = '1ceb287ca8cfdba584fec8d9379f06d567ac3720'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESDCHAR_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-thurtt.git'
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES

define AESDCHAR_BUILD_CMDS
	$(MAKE) -C $(@D)/aesd-char-driver KERNELDIR=$(LINUX_DIR) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)"
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESDCHAR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar.ko $(TARGET_DIR)/lib/modules/$(BR2_LINUX_KERNEL_VERSION)/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/lib/modules/$(BR2_LINUX_KERNEL_VERSION)/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/lib/modules/$(BR2_LINUX_KERNEL_VERSION)/
endef

$(eval $(generic-package))
