#!/bin/bash
set -e

echo 'use of this requires WSL or a linux distribution that supports APT'

read -p 'do you wish to continue (y,n)? ' ANS

if [ $ANS = 'y' ]; then

  cd ~/StarkOS/main
  
  echo 'installing needed things and stuff...'

  sudo apt update && sudo apt upgrade
  sleep 2
  
  sudo apt install -y build-essential nasm grub-pc-bin xorriso mtools qemu-system-x86
  sleep 4
  echo 'installed needed things successfully, continuing to build'

rm -rf ~/StarkOS/main/output
mkdir ~/StarkOS/main/output

	nasm -f elf32 boot/boot.asm -o ~/StarkOS/main/output/boot.o

	gcc -m32 -ffreestanding -Iinclude -c kernel/kernel.c \
  	-o ~/StarkOS/main/output/kernel.o \
  	-fmax-include-depth=1000

gcc -m32 -ffreestanding -Iinclude -c include/keyboard.c \
  -o ~/StarkOS/main/output/keyboard.o \
  -fmax-include-depth=1000

ld -m elf_i386 -T linker.ld -o ~/StarkOS/main/kernel/kernel.bin \
  ~/StarkOS/main/output/boot.o \
  ~/StarkOS/main/output/kernel.o \
  ~/StarkOS/main/output/keyboard.o

cp ~/StarkOS/main/kernel/kernel.bin ~/StarkOS/main/iso/boot/

  grub-mkrescue -o ~/StarkOS/main/StarkOS.iso iso

  echo 'Success! Things ran and built flawlessly, use this qemu command to test in a VM (or flash to a usb idc): qemu-system-i386 -cdrom StarkOS.iso'

  read -p 'would you like to use the qemu command (y, n)? ' ANS2

    if [ $ANS2 = 'y' ]; then
      qemu-system-i386 -cdrom StarkOS.iso

    else
      echo 'cancelled, now exiting'
      
      sleep 3

      exit 1

    fi

else
  echo 'cancelled, now exiting'

  sleep 3

  exit 1
fi
