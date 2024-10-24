code segment
	assume cs:code
	MOV AX,3457
	MOV DS,AX
	MOV SI,3400H
	MOV AL,23H
	NEG AL
	MOV 23h[SI], AL
	MOV ah, 4ch
	INT 21h
code ends
end

