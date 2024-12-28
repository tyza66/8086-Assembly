;高斯算1+2+3....一直加到100
assume cs:code

code segment
	mov ax,0
	mov bx,0
	
	mov cx,100
	s:	
		inc ax
		add bx,ax
		loop s
	
	mov ax,4c00h
	int 21H
code ends
end