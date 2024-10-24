data segment
	arr DB 0A6h, 0D7h, 015h, 084h, 0C2h, 051h, 032h, 0FAh, 034h, 07Fh
	plus DB 10 dup(0)
	minus DB 10 dup(0)
data ends

code segment
	assume cs:code, ds:data
	MOV cl, 0Ah
	LEA bx, arr
	LEA si, plus
	LEA di, minus
	
	repeat: nop
	CMP BYTE PTR ds:[bx], 00h
	JC nega
	JMP posi

	nega: nop
	MOV ch, BYTE PTR ds:[bx]
	MOV ds:[di], ch
	INC di
	INC bx
	DEC cl
	JNZ repeat
	JMP ter

	posi: nop
	MOV ch, BYTE PTR ds:[bx]
	MOV BYTE PTR ds:[si], ch
	INC si
	INC bx
	DEC cl
	JNZ repeat

	ter: MOV ah, 04ch
	INT 21h
code ends
end

