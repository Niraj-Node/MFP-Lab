code segment
	assume cs:code
	MOV ax, 1234h
	MOV bx, 3425h
	ADD ax, bx
	STC
	MOV ax, [bx]
	MOV bx, ds:[2345h]
	INT 03h
code ends
end