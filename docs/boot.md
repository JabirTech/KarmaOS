# How to boot KarmaOS ?
In the file [README.md](https://github.com/JabirTech/KarmaOS/blob/master/README.md) We've explained how to boot KarmaOS in a virtual QEMU machine. But, the boot process is handled by __GRUB__, and this is the boot part in our kernel :

```assembly
%define MBOOT_MAGIC 0x1badb002
%define MBOOT_FLAGS 0x00010002

bits 32
org 0x100000

align 4, db 0

header:
	dd MBOOT_MAGIC
	dd MBOOT_FLAGS
	dd 0 - MBOOT_MAGIC - MBOOT_FLAGS
	dd header
	dd __entry_point
	dd end_of_file
	dd end_of_file
	dd __entry_point
align 4, db 0
```
## Creating bootable disc
The easiest way is using `grub-mkrescue`, the way we've used in our Makefile, but, we'll publish an easier way to boot, as soon as possible.
