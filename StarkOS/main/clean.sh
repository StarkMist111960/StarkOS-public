#/bin/bash
set -e

read -p 'would you like to clean the dirs and build files to do a fresh build (y, n)? ' ANS

if [ $ANS = 'y' ]; then
	rm -rf output
	rm -rf StarkOS.iso
	rm -rf kernel/kernel.bin
	rm -rf iso/boot/kernel.bin
	
	else
		echo 'cancelled'
		exit 1
fi
