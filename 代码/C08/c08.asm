;call指令加上ret指令相当于函数
assume cs:code

code segment
	mov ax,1
	mov cx,3
	call s
	sub ax,1
	
	mov ax,4c00h
	int 21
	
	;上面的int21如果没有的话就相当于死循环相当于永远出不来
	s: 	add ax,ax
		loop s
		ret
		
code ends
end

;call和ret本质上其实是一个压栈的一个操作