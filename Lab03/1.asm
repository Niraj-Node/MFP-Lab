data segment
	n1 DB 1Fh
	n2 DB 1Eh
data ends

code segment
	assume ds:data, cs:code
	MOV ax, data
	MOV ds, ax

	MOV ax, 0000h
	MOV al, n1
	ADD al, n2
	LAHF 
	TEST ah, 10h
	JNZ store
	MOV BYTE PTR ds:3000h, 01h
	INT 03h

	store: nop 
	MOV BYTE PTR ds:3000h, 0FFh
	INT 03h
code ends

end