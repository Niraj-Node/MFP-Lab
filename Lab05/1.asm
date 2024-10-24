code segment
	assume cs:code
	MOV ax, 0F000h
	CBW
	MOV ax, 9F85h
	CWD
	MOV ah, 4ch
	INT 21h
code ends
end