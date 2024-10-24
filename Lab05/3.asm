data segment
	n1 DB ?
data ends

code segment
	assume cs:code, ds:data
	MOV WORD PTR ds:[3000h], 0F008h
	MOV WORD PTR ds:[3002h], 0F008h
	MOV ax, WORD PTR ds:[3000h]
	MOV bx, WORD PTR ds:[3002h]
	ADD bx, ax
	LAHF
	AND ah, 11h
	CMP ah, 11h
	JNZ skip
	MOV BYTE PTR ds:[3006h], 0FFh
	JMP ter

	skip: nop
	MOV [n1+2], 080h

	ter: MOV ah, 04ch
	INT 21h
code ends
end

