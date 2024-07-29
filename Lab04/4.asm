data segment
	msg DB "Hello World$"
data ends

code segment
	assume cs:code, ds:data
	MOV ax, data
	MOV ds, ax

	MOV ah, 01h
	INT 21h
	CMP al, 'Y'
	JNZ ter

	MOV dx, offset msg
	MOV ah, 09h
	INT 21h

	ter: nop
	MOV ah, 4Ch
	INT 21h
code ends
end