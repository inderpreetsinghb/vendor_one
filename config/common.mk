DEVICE_PACKAGE_OVERLAYS += vendor/oneos/overlay/common

ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
else
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
endif

#OneOS_TYPE ?= ALPHA
ifndef ONEOS_TYPE
    ONEOS_TYPE := STABLE
endif

ifeq ($(ONEOS_TYPE), BETA)
endif

ONE_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
ONE_VERSION := $(PLATFORM_VERSION)-$(ONEOS_TYPE)-$(shell date +%Y%m%d-%H%M)-$(ONE_DEVICE)
ONE_BUILD := 1.0.$(TARGET_PRODUCT).$(ONE_TYPE)

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
    Gallery \
    SnapdragonMusic  \
    messaging \
    LiveWallpapersPicker \
    Updater

# Custom off-mode charger
PRODUCT_PACKAGES += \
    charger_res_images \
    one_charger_res_images \
    font_log.png \
    libhealthd.one

# Long screenshot
PRODUCT_PACKAGES += \
    Longshot

# Build sound recorder
PRODUCT_PACKAGES += Recorder

# Build WallpaperPicker
PRODUCT_PACKAGES += WallpaperPicker


include vendor/oneos/config/themes.mk
include vendor/oneos/config/bootanimation.mk
#include vendor/caf/config/gapps.mk

# Support Extra tools
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# These packages are excluded from user builds
PRODUCT_PACKAGES_DEBUG += \
    micro_bench \
    procmem \
    procrank \
    strace

# TWRP
#ifeq ($(WITH_TWRP),true)
#include vendor/oneos/config/twrp.mk
#endif

