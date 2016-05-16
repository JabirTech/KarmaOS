print_string:
	.displaying:
		lodsb
		stosw
		or al, al
		jnz .displaying
	ret
