#OneOS_TYPE ?= ALPHA
ifndef ONE_TYPE
    ONE_TYPE := ALPHA
endif

ifeq ($(ONE_TYPE), BETA)
endif

ONE_RELEASE := 2.0-$(ONE_TYPE)
ONE_DEVICE := $(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
ONE_RELEASE_VERSION := $(ONE_RELEASE)-$(BUILD_ID)-$(shell date +%s)
ONE_VERSION := $(ONE_RELEASE)-$(shell date +%Y%m%d-%H%M)-$(ONE_DEVICE)
ONE_FINGERPRINT := ONE-$(ONE_VERSION)
ONE_API := $(ONE_RELEASE).$(BUILD_ID)
