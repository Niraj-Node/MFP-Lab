DATA SEGMENT
  NUM DW 0005,0007
  LCM DW 2 DUP(0)
DATA ENDS

CODE SEGMENT
	ASSUME CS:CODE,DS:DATA
	START: MOV AX,DATA
	MOV DS,AX
	MOV DX,0H

	MOV AX,NUM
	MOV BX,NUM+2
	MOV CX, NUM
	MOV DX, NUM+2

	repeat: NOP
	CMP AX, BX
	JE STORE
	JC ASMALLER
	ADD BX, DX
	JMP repeat
	ASMALLER: NOP
	ADD AX, CX
	JMP repeat

	STORE: NOP
	MOV LCM, AX
	MOV AX, 4C00H
	INT 21H
CODE ENDS
END