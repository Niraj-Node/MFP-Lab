data segment
data ends

code segment
	assume cs:code, ds:data
	MOV ax, data
	MOV ds, ax

	MOV ah, 01h
	INT 21h

	MOV dl, al
	MOV ah, 02h
	INT 21h

	MOV ah, 4Ch
	INT 21h
code ends
end