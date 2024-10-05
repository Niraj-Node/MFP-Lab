public isr4

data segment public
	str1 db "Overflow Occurred$", 0
data ends

code2 segment public
	assume cs:code2, ds:data

isr4 PROC FAR
	mov ax, data
	mov ds, ax
    mov ah, 09h
	mov dx, offset str1
	int 21h
    IRET
isr4 ENDP

code2 ends
end