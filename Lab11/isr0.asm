public isr0

data segment public
	str1 db "Divide by 0 Error Occurred$"
data ends

code2 segment public
	assume cs:code2, ds:data

isr0 PROC FAR
	pop bp
	mov ax, data
	mov ds, ax
    mov ah, 09h
	mov dx, offset str1
	int 21h
	inc bp
	push bp
    IRET
isr0 ENDP

code2 ends
end