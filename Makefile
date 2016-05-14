all:
	nasm -f bin kernel.asm -o kernel.o
	mkdir -pv boot/boot/grub
	touch boot/boot/grub/grub.cfg
	echo 'menuentry "KarmaOS"{ multiboot /boot/kernel.o }' > boot/boot/grub/grub.cfg
	mv kernel.o ./boot/boot/kernel.o
	grub-mkrescue -o boot.iso boot/
emu:
	qemu-system-i386 -cdrom boot.iso
clean:
	rm -rvf boot*
