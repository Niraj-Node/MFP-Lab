data segment
	n1 DD 05132FA32h
	n2 DD 034125943h
	ans DW 2 dup(0)
data ends

code segment
	assume cs:code, ds:data
	MOV ax, data
	MOV ds, ax

	MOV ax, WORD PTR [n1]
	SUB ax, WORD PTR [n2]
	MOV ans, ax

	MOV ax, WORD PTR [n1+2]
	SBB ax, WORD PTR [n2+2]
	MOV ans+2, ax
	INT 03h
code ends

end