# Release name
PRODUCT_RELEASE_NAME := HtcLeo

# Boot animation
BOOT_ANIMATION_SIZE := wvga

$(call inherit-product, $(SRC_EVERVOLV_DIR)/config/apns.mk)
$(call inherit-product, $(SRC_EVERVOLV_DIR)/config/common_full_phone.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, device/htc/htcleo/device_htcleo.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := htcleo
PRODUCT_NAME := ev_htcleo
PRODUCT_BRAND := htc
PRODUCT_MODEL := Htc Hd2
PRODUCT_MANUFACTURER := HTC
