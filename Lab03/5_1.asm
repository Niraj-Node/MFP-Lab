data segment
	n1 DW 0647Fh
	n2 DB 093h
	quotient DB ?
    remainder DB ?
data ends

code segment
	assume cs:code, ds:data
	MOV ax, data
	MOV ds, ax

	MOV ax, n1
	DIV n2
    MOV quotient, al
    MOV remainder, ah
	INT 03h
code ends
end