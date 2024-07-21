data segment
	num1 DD 05132FA32h
	num2 DD 034125943h
	sum DW 3 dup(0)
data ends

code segment
	assume DS:data, cs:code
	MOV ax, data
	MOV ds, ax
	
	MOV ax, WORD PTR [num1]
	ADD ax, WORD PTR [num2]
	MOV sum, ax

	MOV ax, WORD PTR [num1+2]
	ADC ax, WORD PTR [num2+2]
	MOV sum+2, ax
	JNC skip
	MOV sum+4, 01h
	skip: nop
	INT 03h
code ends
end