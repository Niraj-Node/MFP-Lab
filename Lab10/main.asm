data segment public
	str1 db 29,"hey there hey there hey there$"
data ends

my_stack segment stack
	dw 28 dup(0)
	stack_top label word
my_stack ends

public  str1
extrn print:far

code segment
	assume cs:code,ds:data,ss:my_stack

	mov ax,data
	mov ds,ax
	mov ax,my_stack
	mov ss,ax
	mov sp,offset stack_top

	call print

	mov ax,4c00h
	int 21h
code ends
end