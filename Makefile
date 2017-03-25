# Copyright (C) 2017 The Android Open Source Project
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
#******************************************************************************
#
# Makefile - Make file for eclipse integration
#
# Copyright (c) 2017 Roger Ye.  All rights reserved.
#
# This is part of the build for virtual device x86vbox.
#
#******************************************************************************

all:
	@echo "Usage: "
	@echo "Support the following build targets:"
	@echo "  gen-ramdisk-recovery, install-recovery, snod, initrd, clean-initrd"
	@echo "  recoveryimage, clean-recoveryimage, ramdisk-recovery"
	@echo "  make gen-ramdisk-recovery"

gen-ramdisk-recovery:
	dd if=/dev/zero of=${OUT}/6MB bs=1M count=6
	cat ${OUT}/ramdisk-recovery.img >> ${OUT}/6MB; mv ${OUT}/6MB ${OUT}/initrd.gz

install-recovery:
	adb shell rm /sdcard/NativeSD/initrd.gz
	adb shell rm /sdcard/NativeSD/zImage
	adb push ${OUT}/kernel /sdcard/NativeSD/zImage
	adb push ${OUT}/initrd.gz /sdcard/NativeSD/initrd.gz

snod:
	cd ../../..;make snod

kernel:
	cd ../../..;make  -C kernel/htc/leo O=/home/sgye/vol2/home/roger/cm/out/target/product/leo/obj/KERNEL_OBJ ARCH=arm zImage

initrd:
	cd ../../..;out/host/linux-x86/bin/mkbootfs ${OUT}/system ${OUT}/root | out/host/linux-x86/bin/minigzip > ${OUT}/ramdisk.img

clean-initrd:
	rm ${OUT}/ramdisk.img
	rm -rf ${OUT}/root

ramdisk-recovery:
	cd ../../..;out/host/linux-x86/bin/mkbootfs ${OUT}/system ${OUT}/recovery/root | out/host/linux-x86/bin/minigzip > ${OUT}/ramdisk-recovery.img

recoveryimage:
	cd ../../..;make -j4 recoveryimage 2>&1 | tee cm_leo-userdebug`date +%Y%m%d`.txt

clean-recoveryimage:
	rm ${OUT}/recovery.img
	rm -rf ${OUT}/recovery/root
	rm ${OUT}/ramdisk-recovery.img
