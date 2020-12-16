################################################################################
#
# libfoo
#
################################################################################
LIBQUIRC_VERSION = 1.0.0
LIBQUIRC_SOURCE = libquirc-$(LIBQUIRC_VERSION).tar.gz
LIBQUIRC_SITE = $(call github,evolation,libquirc,$(LIBQUIRC_VERSION))
LIBQUIRC_LICENSE = GPL-3.0+
LIBQUIRC_DEPENDENCIES = sdl
LIBQUIRC_INSTALL_STAGING = YES
define LIBQUIRC_BUILD_CMDS
    $(TARGER_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) quirc-scanner
endef


#define LIBQUIRC_INSTALL_TARGET_CMDS
#	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
#endef

$(eval $(generic-package))
