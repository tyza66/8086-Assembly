assume cs:code,ds:data,ss:stack

data segment
	arr db 1,2,3,4,10,20,30,40 ;110 6E
	str db 'Hello world','$'
data ends

stack segment
	db 10 dup(0)
stack ends

code segment
start:	mov ax,data	;先将ds指向数据区
		mov ds,ax
		
		mov ax,0 	;ax作为累加计数器
		mov bx,0	;bx作为偏移地址
		mov cx,8	;循环次数
		
for:	add al,ds:arr[bx]	;依次将数组中内容加到al上
		adc ah,0			;db数组中的字节而AX的大小是一个字，所以这样处理一下进位
		inc bx				;指针移动
		loop for			;循环

		mov ax,4c00H
		int 21H
code ends
end start

;编程思想就是想一下大部分高级语言怎么写之后翻译成汇编语言