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
	mov ebx, string
	call puts
	mov ebx, string2
	call puts
	mov ebx, string3
	call puts
	jmp short $

%include "./colors.asm"
%include "./string.asm"





string db 'Welcome to Karma operating system!',  0
string2 db 'Designed and implemented by Jabir Project and Nano Foundation', 0
string3 db 'Core developer: Muhammadreza Haghiri', 0
url db 'Website: http://jabirproject.org', 0
info db 'Operating system code and guides are available in our github repositories, for more information, check them out.', 0
cursx db 0
cursy db 0
align 4, db 0
end_of_file:
