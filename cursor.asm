;-------------------------
;
; This code changes the
; cursor's position.
;-------------------------

MovCur:
	pusha
	xor eax, eax
	mov ecx, COLS
	mov al, bh
	mul ecx
	add al, bl
	mov ebx, eax
	mov al, 0x0f
	mov dx, 0x03d4
	out dx, al
	mov al, bl
	mov dx, 0x03d5
	out dx, al
	xor eax, eax
	mov al, 0x0e
	mov dx, 0x03d4
	out dx, al
	mov al, bh
	mov dx, 0x03d5
	out dx, al
	popa
	ret
