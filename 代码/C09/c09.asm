;ret是近转移指令、retf是远转移指令
;ret改变的是IP的内容、retf改变的是CS和IP的内容
;如果想call一个非常远的代码以至于不能直接修改IP就能到
;call也分为call和call far ptr  意思就是如果仅仅修改IP不足以将指针指向想要指向的函数
;这些操作的本质就是压栈
assume cs:code

code segment
	mov ax,1
	mov cx,3
	call s	;call的时候相当于将它的下一句的地址（IP）压到栈里面了
	sub ax,1
	
	mov ax,4c00h
	int 21H
	
	s: 	add ax,ax
		loop s
		ret
		;ret之后会回到上一次call它那个地方的下一句 相当于弹栈（IP）了
		
code ends
end

;区别在于call far ptr 保存的是call的下一句的CS:IP   retf弹回的是call的下一句的CS:IP 先压CS再压IP
;在栈中，CS 寄存器的值在更底部，而 IP 寄存器的值在 CS 之上
;如果不call直接ret也会从栈顶取一个IP跳过去
;如果不ret那就会在进入函数之后一直往后执行下去
;可以理解call就是goto的命令