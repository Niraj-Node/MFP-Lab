data segment
	n1 dW 01234h
	n2 dW 0F635h
data ends

code segment
	assume cs:code, ds:data
	MOV ax, data
	MOV ds, ax

	MOV ax, n1
	ADD ax, WORD PTR [n2]
	MOV ds:[0004h], ax
	JNC skip
	MOV BYTE PTR ds:[0006h], 01h
	skip: nop
	INT 03h
code ends

end