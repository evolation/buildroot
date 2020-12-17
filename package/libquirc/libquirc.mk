################################################################################
#
# libfoo
#
################################################################################
LIBQUIRC_VERSION = 1.0.2
LIBQUIRC_SOURCE = libquirc-$(LIBQUIRC_VERSION).tar.gz
LIBQUIRC_SITE = $(call github,evolation,libquirc,$(LIBQUIRC_VERSION))
LIBQUIRC_LICENSE = GPL-3.0+
LIBQUIRC_DEPENDENCIES = sdl libpng jpeg sdl_gfx
LIBQUIRC_INSTALL_STAGING = YES

define LIBQUIRC_BUILD_CMDS
    $(TARGER_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="-O3 -Wall -fPIC" SDL_CFLAGS="-D_GNU_SOURCE=1 -D_REENTRANT -I$(TARGET_DIR)/usr/include/SDL" SDL_LIBS="-lSDL" -C $(@D) all
endef


define LIBQUIRC_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
endef

$(eval $(generic-package))
