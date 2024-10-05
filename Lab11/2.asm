extrn isr4 : far

my_stack segment stack
	dw 20 dup(0)
	s_top label word
my_stack ends

code segment
	assume cs:code, ss:my_stack
	mov ax, my_stack
	mov ss, ax
	mov sp, offset s_top

	xor ax, ax
    mov es, ax
    mov word ptr es:[10h], offset isr4
	mov word ptr es:[12h], seg isr4
   
	mov al, 07fh
	mov bl, 01h
	add al, bl
	INTO
	
	mov ax, 4c00h
	int 21h
code ends
end