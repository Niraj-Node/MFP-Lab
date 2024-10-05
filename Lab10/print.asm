data segment public
	extrn str1:word
data ends

public print

code_proc segment public

print proc far
	assume cs:code_proc, ds:data

	lea dx, str1
	mov ah,09h
	int 21h
	
	ret
print endp

code_proc ends
end


