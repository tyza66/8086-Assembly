assume cs:code,ds:data,ss:stack

data segment
	arr dw 1H,1H,100 dup(0)
data ends

stack segment
	db 10 dup(0)
stack ends

;求斐波那契数列可以利用双指针+数组的方法
;还是不可以将两个内存直接相加，需要通过寄存器
code segment
start:	mov ax,data	;先将ds指向数据区
		mov ds,ax
		mov ax,stack;将ss指向栈区域
		mov ss,ax
		
		mov bx,4
		mov cx,10

for:	mov dx,0
		add dx,ds:arr[bx-2]
		add dx,ds:arr[bx-4]
		mov ds:arr[bx],dx
		
		add bx,2
		loop for

		mov ax,4c00H
		int 21H
code ends
end start