DEVICE_PACKAGE_OVERLAYS += vendor/oneos/overlay/common
$(call inherit-product, vendor/oneos/config.mk)

ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
else
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
endif

#OneOS_TYPE ?= ALPHA
ifndef ONE_TYPE
    ONE_TYPE := ALPHA
endif

ifeq ($(ONE_TYPE), BETA)
endif

ONE_RELEASE := 2.0-$(ONE_TYPE)
ONE_DEVICE := $(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
ONE_VERSION := $(ONE_RELEASE)-$(shell date +%Y%m%d-%H%M)-$(ONE_DEVICE)
OVE_FINGERPRINT := ONE-$(ONE_VERSION)

# Include support for GApps backup
PRODUCT_COPY_FILES += \
    vendor/oneos/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/oneos/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/oneos/prebuilt/bin/50-backuptool.sh:system/addon.d/50-backuptool.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/oneos/prebuilt/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/oneos/prebuilt/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/oneos/prebuilt/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Permissions
PRODUCT_COPY_FILES += \
    vendor/oneos/prebuilt/common/etc/permissions/privapp-aosp-caf-permission.xml:/system/etc/permissions/privapp-aosp-caf-permission.xml

# Scripts
PRODUCT_COPY_FILES += \
    vendor/oneos/prebuilt/common/etc/init/aosp-caf_updates.rc:system/etc/init/aosp-caf_updates.rc

# APNS
PRODUCT_COPY_FILES += \
    vendor/oneos/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Disable qmi EAP-SIM security
DISABLE_EAP_PROXY := true

# Build Snapdragon apps
PRODUCT_PACKAGES += \
    Aurora \
    Music \
    Gallery \
    CMFileManager \
    messaging \
    EmergencyInfoGoogleNoUi \
    Calender \
    Browser \
    ThemePicker \
    PixelThemes \
    Updater \
    LiveWallpapersPicker


# Custom off-mode charger
PRODUCT_PACKAGES += \
    charger_res_images \
    one_charger_res_images \
    font_log.png \
    libhealthd.one

# Build sound recorder
PRODUCT_PACKAGES += Recorder

# Build WallpaperPicker
PRODUCT_PACKAGES += WallpaperPicker

include vendor/oneos/config/themes.mk
include vendor/oneos/bootanimation/bootanimation.mk

#include vendor/caf/config/gapps.mk
