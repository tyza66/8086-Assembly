;loop是伪指令不能在debug里面写，只能在文件里面写
;cx有这样一重含义，计数器。执行循环指令的时候，会先进行cx=cx-1，之后判断cx的值，如果不为0就执行程序，如果为0就直接向下执行

assume cs:code

code segment
	mov ax,2
	
	mov cx,11
s:	add ax,ax			;这里其实也执行了1次乘以二
	loop s				;这里想要执行10次add 一共11次
	
	mov ax,4c00h
	int 21
code ends
end

;在debug中可以直接用g指令制定到某个执行的偏移地址 g 0012就是执行到0012的位置
;还有个p指令 在下一条指令是loop指令的时候（即将loop）的时候 指定p指令，直接执行到loop的下面一条指令

;如果给cx设置成了0那么在执行loop的时候会出现死循环，但是从FFFF也能减少到0，就是步骤会非常多
;原本的设计还是很合理的，因为cx我一开始定了了几次最终就会执行几次