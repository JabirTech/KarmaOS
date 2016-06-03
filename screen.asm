clrs:
	pusha
	cld
	mov edi, VID_MEM
	mov cx, 2000
	mov ah, CHAR_ATTRIB
	mov al, ' '
	rep stosw
	mov byte [_CursX], 0
	mov byte [_CursY], 0
	popa
	ret
