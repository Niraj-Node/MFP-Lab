DATA SEGMENT
	NUM DW 0005,0007      
	LCM DW 0              
DATA ENDS

MY_STACK SEGMENT STACK
	DW 20 DUP(0)           
	STACK_TOP LABEL WORD   
MY_STACK ENDS

CODE SEGMENT
	ASSUME CS:CODE, DS:DATA, SS:MY_STACK

	MOV AX, DATA           
	MOV DS, AX             
	MOV AX, MY_STACK       
	MOV SS, AX             
	MOV SP, STACK_TOP      
  
	; Push the values of NUM and NUM+2 onto the stack
	LEA SI, NUM            
	PUSH WORD PTR [SI]     
	PUSH WORD PTR [SI+2]   

	CALL CALC_LCM

	; Store result (LCM) in memory location LCM
	LEA DI, LCM            
	POP AX				; Result is still on the stack, copy it to AX
	MOV [DI], AX           

	MOV AX, 4C00H          
	INT 21H

CALC_LCM PROC NEAR
	PUSH BP                
	MOV BP, SP             
  
	MOV AX, [BP+4]         
	MOV BX, [BP+6]         
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
	  MOV [BP+4], AX         
	  POP BP                 
	  RET                    
CALC_LCM ENDP

CODE ENDS
END
