data segment
	array DB 0A6h, 0D7h, 015h, 0B4h, 0C2h
	min dB ?
data ends

code segment
	assume cs:code, ds:data
	MOV ax, data
	MOV ds, ax

	MOV al, 0FFh
	MOV cl, 05h
	LEA bx, array

	iterate: nop
	CMP al, BYTE PTR [bx]
	JNC swap
	JMP next 

	swap: nop
	MOV al, BYTE PTR [bx]
	next: nop
	INC bx
	DEC cl
	JNZ iterate

	MOV min, al
	MOV ah, 4Ch
	INT 21h
code ends
end