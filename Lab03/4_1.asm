data segment
	n1 DB 7Fh
	n2 DB 93h
	product DW ?
data ends

code segment
	assume cs:code, ds:data
	MOV ax, data
	MOV ds, ax

	MOV al, n1
	MUL n2
	MOV product, ax
	INT 03h
code ends

end
