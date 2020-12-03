################################################################################
#
# libfoo
#
################################################################################
LIBQUIRC_VERSION = 1.0.0
LIBQUIRC_SOURCE = libquirc-$(LIBFOO_VERSION).tar.gz
LIBQUIRC_SITE = https://github.com/evolation/libquirc
LIBQUIRC_LICENSE = GPL-3.0+
LIBQUIRC_LICENSE_FILES = COPYING
LIBQUIRC_INSTALL_STAGING = YES

define LIBQUIRC_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef
