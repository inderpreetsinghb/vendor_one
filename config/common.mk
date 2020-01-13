DEVICE_PACKAGE_OVERLAYS += vendor/caf/overlay/common

# Disable qmi EAP-SIM security
DISABLE_EAP_PROXY := true

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation

# Build Snapdragon apps
PRODUCT_PACKAGES += \
    Gallery \
    SnapdragonMusic  \
    CMFileManager \
    messaging \
    LiveWallpapersPicker

# Build sound recorder
PRODUCT_PACKAGES += SoundRecorder

# Build WallpaperPicker
PRODUCT_PACKAGES += WallpaperPicker

ifneq ($(HOST_OS),linux)
ifneq ($(sdclang_already_warned),true)
$(warning **********************************************)
$(warning * SDCLANG is not supported on non-linux hosts.)
$(warning **********************************************)
sdclang_already_warned := true
endif
else
# include definitions for SDCLANG
include vendor/caf/sdclang/sdclang.mk
endif

include vendor/caf/config/prebuilt.mk
include vendor/caf/config/branding.mk
include vendor/caf/config/prop.mk
include vendor/caf/config/gapps.mk
