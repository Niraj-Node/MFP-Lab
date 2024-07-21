data segment
	n1 DW 0647Fh
	n2 DW 02593h
	diff DW ?
data ends

code segment
	assume cs:code, ds:data
	MOV ax, data
	MOV ds, ax

	MOV ax, n1
	MOV bx, n2
	NOT bx
	INC bx
	ADD ax, bx
	MOV diff, ax
	INT 03h
code ends
end