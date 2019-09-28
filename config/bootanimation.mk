# Bootanimation
ifneq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += vendor/caf/prebuilt/common/media/bootanimation_1080.zip:system/product/media/bootanimation.zip
else
     PRODUCT_COPY_FILES += vendor/caf/prebuilt/common/media/bootanimation_720.zip:system/product/media/bootanimation.zip
endif
