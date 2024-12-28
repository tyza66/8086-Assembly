;如果一段诗句代码啥的加在一起的空间超过了64KB那肯定是不能放在一起的，或者为了解决之前的混乱问题也可以这么搞
assume cs:code,ds:data,ss:stack

data segment
	db 'Hello world'  ;汇编语言中不仅仅可以存数字，还可以存一句话 076A:0000  对应的是转换成十进制之后对应的ascii码
	dw 23H,456H,789H,0abcH,0defH
	db 10 dup(1,2,3)				;存进去就是01 02 03 01 02 03 ...
	db 3 dup ('abc','def')
data ends

stack segment
	db 10 dup(0)   ;10 dup(0)相当于定义10个0
stack ends

code segment
start: 	mov ax,data	;这就是存放data的段地址
		mov ss,ax
		
		mov ax,4c00h
		int 21H
code ends
end start

;为了段防止冲突，段里的地址位置一定是16的倍数字节，至少是16个字节
;数据段、栈段、代码段直接的地址其实是连续的
;如果不写start CS:IP的未知默认是不对的 start的目的就是让CS和IP指向正确的开始的地方