# Include support for GApps backup
PRODUCT_COPY_FILES += \
    vendor/one/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/one/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/one/prebuilt/bin/50-backuptool.sh:system/addon.d/50-backuptool.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/one/prebuilt/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/one/prebuilt/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/one/prebuilt/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Permissions
PRODUCT_COPY_FILES += \
    vendor/one/prebuilt/common/etc/permissions/privapp-one-permission.xml:/system/etc/permissions/privapp-one-permission.xml

# Scripts
PRODUCT_COPY_FILES += \
    vendor/one/prebuilt/common/etc/init/one_updates.rc:system/etc/init/one_updates.rc

# APNS
PRODUCT_COPY_FILES += \
    vendor/one/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml
	
# FONTS
PRODUCT_COPY_FILES += \
    vendor/one/prebuilt/common/fonts:system/fonts
	
# Media
PRODUCT_COPY_FILES += \
    vendor/one/prebuilt/common/media:system/media
