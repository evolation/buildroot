################################################################################
#
# libfoo
#
################################################################################
LIBQUIRC_VERSION = 1.0.0
LIBQUIRC_SOURCE = libquirc-$(LIBQUIRC_VERSION).tar.gz
LIBQUIRC_SITE = $(call github,evolation,libquirc,$(LIBQUIRC_VERSION))
LIBQUIRC_LICENSE = GPL-3.0+

define LIBQUIRC_BUILD_CMDS
    $(TARGER_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define LIBQUIRC_EXTRACT_CMDS
    $(call suitable-extractor,$(LIBQUIRC_SOURCE)) $(LIBQUIRC_DL_DIR)/$(LIBQUIRC_SOURCE) | \
	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
    
	mv $(@D)/LIBQUIRC-$(LIBQUIRC_VERSION)/* $(@D)
	$(RM) -r $(@D)/LIBQUIRC-$(LIBQUIRC_VERSION)
endef


define LIBQUIRC_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
endef

$(eval $(generic-package))
