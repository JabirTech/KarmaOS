ESC_KEY   EQU 0x1B
KBD_DAT   EQU 0x60
MOV_UP    EQU 0x11
MOV_DOWN  EQU 0x13
MOV_RIGHT EQU 0x12
MOV_LEFT  EQU 0x14
ENTER_BTN EQU 0x0D

_CursY_tmp db 0
__x 	   db 0
__y	       db 0
_CX		   db 0
_CY		   db 0
temp	   dw 0
x		   db 'a'
table	   db 0x1b, '1234567890-=', 0x08, 0x09
	  	   db 'qwertyuiop[]', 0x0d, 0
		   db 'asdfghjkl;', 0x27, 0x60, 0, '\'
		   db 'zxcvbnm,./',0,0,0, ' ', 0
		   db 0,0,0,0,0,0,0,0,0,0
		   db 0,0,0,0x11,0,0,0x14,0,0x12,0	
		   db 0,0x13,0,0,0,0,0,0,0,0

