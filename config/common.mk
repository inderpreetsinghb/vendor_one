DEVICE_PACKAGE_OVERLAYS += vendor/one/overlay/common

# Disable qmi EAP-SIM security
DISABLE_EAP_PROXY := true

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation.zip

# Custom off-mode charger
PRODUCT_PACKAGES += \
    charger_res_images \
    one_charger_res_images \
    font_log.png \
    libhealthd.one

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0.vendor

ifneq ($(HOST_OS),linux)
ifneq ($(sdclang_already_warned),true)
$(warning **********************************************)
$(warning * SDCLANG is not supported on non-linux hosts.)
$(warning **********************************************)
sdclang_already_warned := true
endif
else
# include definitions for SDCLANG
include vendor/one/sdclang/sdclang.mk
endif

include vendor/one/config/prebuilt.mk
include vendor/one/config/packages.mk
include vendor/one/config/branding.mk
include vendor/one/config/prop.mk
include vendor/one/config/gapps.mk
include packages/overlays/Themes/themes.mk

