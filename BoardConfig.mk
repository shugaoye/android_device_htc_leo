# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# general 
USE_CAMERA_STUB := false

TARGET_SPECIFIC_HEADER_PATH := device/htc/leo/include

# Board/CPU
TARGET_NO_BOOTLOADER := true
BOARD_VENDOR := htc
TARGET_BOOTLOADER_BOARD_NAME := htcleo
TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := scorpion
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_NEEDS_NON_PIE_SUPPORT := true
TARGET_DISABLE_ARM_PIE := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/htc/leo
TARGET_KERNEL_CONFIG := htcleo_defconfig
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x11800000
BOARD_KERNEL_NEW_PPPOX := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/htc/leo/bluetooth/vnd_qsd8k.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/htc/leo/bluetooth/include

# Display
BOARD_EGL_CFG := device/htc/leo/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
TARGET_DISABLE_TRIPLE_BUFFERING := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_NO_HW_VSYNC := true
COMMON_GLOBAL_CFLAGS += -DTARGET_8x50
TARGET_FORCE_SCREENSHOT_CPU_PATH := true
TARGET_USES_ION := true
HWUI_COMPILE_FOR_PERF := true

#Bottanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true
TARGET_BOOTANIMATION_HALF_RES := true

# Camera/Media
TARGET_USES_SUBMIT_ONE_INPUT_BUFFER := true
TARGET_NEEDS_PRELINK_SUPPORT := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_PMEM_ADSP := true
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK

# Wifi bcmdhd config
WIFI_BAND := 802_11_ABG
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_NAME := bcmdhd

# Audio
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := false

# Compass/Accelerometer
BOARD_VENDOR_USE_AKMD := akm8973

# GPS
BOARD_USES_GPSSHIM := true
BOARD_GPS_LIBRARIES := libgps

# Legacy
BOARD_USE_LEGACY_TRACKPAD := true

# SELinux
-include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/htc/leo/sepolicy

BOARD_SEPOLICY_UNION += \
    akmd.te

# ART
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),userdebug)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_ONLY ?= true
TARGET_CPU_SMP := false
MALLOC_IMPL := dlmalloc

# Recovery
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760 # 10M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20485760 # 20M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1027604480 # 400M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1027604480 # 400M
BOARD_FLASH_BLOCK_SIZE := 4096

#Use our own init.rc that mounts cache under data/cache
TARGET_PROVIDES_INIT_RC := true

# Ril
BOARD_USES_LEGACY_RIL := true
LEGACY_RIL := true

# USB
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun0/file"
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun0/file"

# Healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.qsd8k

# Recovery
TARGET_RECOVERY_FSTAB := device/htc/leo/recovery/fstab.htcleo
RECOVERY_FSTAB_VERSION := 2

#
# TWRP configuration START
#

# This is for CM
RECOVERY_VARIANT := twrp

# Redefine these two variables, since they are defined in device/generic/common/BoardConfig.mk
TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false

# Recovery:Start

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_MTP := true
TWRP_EVENT_LOGGING := true
# This excludes parted from the build... parted is prebuilt and for arm CPU only
BOARD_HAS_NO_REAL_SDCARD := true

#
# TWRP configuration END
#

