# Release name
PRODUCT_RELEASE_NAME := HtcLeo

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Inherit some common CM stuff.
# $(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, device/htc/htcleo/device_htcleo.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := htcleo
PRODUCT_NAME := htcleo
PRODUCT_BRAND := htc
PRODUCT_MODEL := Htc Hd2
PRODUCT_MANUFACTURER := HTC
