all:
	@echo "Usage: "
	@echo "      $ make gen-ramdisk-recovery"
gen-ramdisk-recovery:
	dd if=/dev/zero of=${OUT}/6MB bs=1M count=6
	cat ${OUT}/ramdisk-recovery.img >> ${OUT}/6MB; mv ${OUT}/6MB ${OUT}/initrd.gz
