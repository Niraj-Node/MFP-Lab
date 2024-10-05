DATA SEGMENT
  NUM DW 0005,0007      
  LCM DW 0              
DATA ENDS

CODE SEGMENT
	ASSUME CS:CODE, DS:DATA
	MOV AX, DATA           
	MOV DS, AX
  
	MOV AX, NUM            
	MOV BX, NUM+2          
  
	; Call LCM procedure with AX and BX
	CALL CALC_LCM
  
	; Store result into memory location LCM
	MOV LCM, AX
  
	; Exit the program
	MOV AX, 4C00H
	INT 21H

; Near procedure to calculate LCM
; Input: AX = First number, BX = Second number
; Output: AX = LCM
CALC_LCM PROC NEAR
	PUSH CX                
	PUSH DX
  
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
	  ; LCM found in AX
	  POP DX                 
	  POP CX
	  RET                    
CALC_LCM ENDP

CODE ENDS
END