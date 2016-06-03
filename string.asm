putc:
	pusha
	mov edi, VID_MEM
	xor eax, eax
	mov ecx, COLS*2
	mov al, byte [_CursY]
	mul ecx
	push eax
	mov al, byte [_CursX]
	mov cl, 2
	mul cl
	pop ecx
	add eax, ecx
	xor ecx, ecx
	add edi, eax
	cmp bl, 0x0a
	je .Row
	mov dl, bl
	mov dh, CHAR_ATTRIB
	mov word [edi], dx
	inc byte [_CursX]
	cmp byte [_CursX], COLS
	je .Row
	jmp .Done
.Row:
	mov byte [_CursX], 0
	inc byte [_CursY]
.Done:
	popa
	ret
;-----------------------------
;     Printing Strings
;	    stored in ebx
;-----------------------------

puts:
	pusha
	push ebx
	pop edi
.Loop:
	mov bl, byte [edi]
	cmp bl, 0
	je .Done
	call putc
.Next:
	inc edi
	jmp .Loop
.Done:
	mov bh, byte [_CursX]
	mov bl, byte [_CursY]
	;call MovCur
	popa
	ret
	
