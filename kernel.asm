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

%define VID_MEM 0xb8000
%define COLS 80
%define LINES 25
%define CHAR_ATTRIB 15

_CursX db 0
_CursY db 0

__entry_point:
	call clrs
	mov ebx, string
	call puts
	mov ebx, string2
	call puts
	mov ebx, string3
	call puts
	mov ebx, url
	call puts
	mov ebx, info
	call puts
	jmp short $

%include "./cursor.asm"
%include "./screen.asm"
%include "./colors.asm"
%include "./string.asm"
%include "./kbd.asm"





string db 'Welcome to Karma operating system!',  10, 0
string2 db 'Designed and implemented by Jabir Project and Nano Foundation', 10, 0
string3 db 'Core developer: Muhammadreza Haghiri', 10, 0
url db 'Website: http://jabirproject.org', 10, 0
info db 'Operating system code and guides are available in our github repositories, for more information, check them out.', 10, 0

align 4, db 0
end_of_file:
