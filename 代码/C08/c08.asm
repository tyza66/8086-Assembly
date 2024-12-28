;call指令加上ret指令相当于函数
assume cs:code

code segment
	mov ax,1
	mov cx,3
	call s
	sub ax,1
	
	mov ax,4c00h
	int 21
	
	s: 	add ax,ax
		loop s
		ret
		
code ends
end