DATA SEGMENT
	NUM DW 0005,0007      
	LCM DW 0              
DATA ENDS

CODE SEGMENT
	ASSUME CS:CODE, DS:DATA
	MOV AX, DATA           
	MOV DS, AX
  
	; Set up pointers to NUM and LCM using SI and DI
	LEA SI, NUM           
	LEA DI, LCM             
  
	CALL CALC_LCM

	MOV AX, 4C00H
	INT 21H

CALC_LCM PROC NEAR
	PUSH AX
	PUSH BX
	PUSH CX                
	PUSH DX
  
	MOV AX, [SI]          
	MOV BX, [SI+2]        
	MOV CX, AX             
	MOV DX, BX             

	repeat:
	  CMP AX, BX             
	  JE OVER                
	  JC ASMALLER            
	  ADD BX, DX             
	  JMP repeat            
	ASMALLER:
	  ADD AX, CX             
	  JMP repeat	           

	OVER:
	  MOV [DI], AX
	  POP DX                 
	  POP CX
	  POP BX
	  POP AX
	  RET                   
CALC_LCM ENDP

CODE ENDS
END
