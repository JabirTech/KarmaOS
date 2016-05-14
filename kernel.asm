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

__entry_point:
	mov edi, 0xb8000
	call white_on_blue
	mov esi, string
	call print_string
	mov edi, 0xb80a0
	mov esi, string2
	call blue_on_black
	call print_string
	mov edi, 0xb8140
	mov esi, string3
	call blue_on_black
	call print_string
	jmp short $

white_on_blue:
	mov ah, 0x9f
	ret

blue_on_black:
	mov ah, 0x09
	ret



print_string:
	.displaying:
		lodsb
		stosw
		or al, al
		jnz .displaying
	ret





string db 'Welcome to Karma operating system!',  0
string2 db 'Designed and implemented by Jabir Project and Nano Foundation', 0
string3 db 'Core developer: Muhammadreza Haghiri', 0
cursx db 0
cursy db 0
align 4, db 0
end_of_file: