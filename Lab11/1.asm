extrn isr0 : far

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
    mov word ptr es:[00h], offset isr0
	mov word ptr es:[02h], seg isr0
   
	mov ax, 0005h
	mov bl, 00h
	div bl
	
	mov ax, 4c00h
	int 21h
code ends
end