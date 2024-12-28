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
start: 	mov ax,stack
		mov ss,ax

code ends
end start
