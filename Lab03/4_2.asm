data segment
	n1 DW 0647Fh
	n2 DW 02593h
	product DW ?
data ends

code segment
	assume cs:code, ds:data
	MOV ax, data
	MOV ds, ax

	MOV ax, n1
	MUL n2
	MOV product, ax
	MOV product+2, dx 
	INT 03h
code ends

end
