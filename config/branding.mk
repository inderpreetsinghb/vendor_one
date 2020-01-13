#CAF_TYPE ?= ALPHA
ifndef CAF_TYPE
    CAF_TYPE := ALPHA
endif

ifeq ($(CAF_TYPE), BETA)
endif

CAF_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
CAF_VERSION := $(PLATFORM_VERSION)-$(shell date +%Y%m%d-%H%M)-$(CAF_DEVICE)-TEAMONE