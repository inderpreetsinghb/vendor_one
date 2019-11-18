# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

ADDITIONAL_BUILD_PROPERTIES += \
    ro.oneos.base.version=$(ONE_RELEASE_VERSION) \
    ro.oneos.display.version=$(ONE_RELEASE) \
    ro.oneos.releasetype=$(ONE_TYPE)	\
    ro.oneos.version=$(ONE_RELEASE)
