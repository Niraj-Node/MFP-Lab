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
	IDIV n2 ;Signed Divison
    MOV quotient, al
    MOV remainder, ah
	MOV ah, 4Ch
	INT 21h
code ends
end