# Include support for GApps backup
PRODUCT_COPY_FILES += \
    vendor/caf/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/caf/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/caf/prebuilt/bin/50-backuptool.sh:system/addon.d/50-backuptool.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/caf/prebuilt/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/caf/prebuilt/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/caf/prebuilt/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Permissions
PRODUCT_COPY_FILES += \
    vendor/caf/prebuilt/common/etc/permissions/privapp-aosp-caf-permission.xml:/system/etc/permissions/privapp-aosp-caf-permission.xml

# Scripts
PRODUCT_COPY_FILES += \
    vendor/caf/prebuilt/common/etc/init/aosp-caf_updates.rc:system/etc/init/aosp-caf_updates.rc

# APNS
PRODUCT_COPY_FILES += \
    vendor/caf/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml
	
# FONTS
PRODUCT_COPY_FILES += \
    vendor/caf/prebuilt/common/fonts:system/fonts
	
# Media
PRODUCT_COPY_FILES += \
    vendor/caf/prebuilt/common/media:system/media
