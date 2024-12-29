assume cs:code,ds:data,ss:stack

data segment
	arr dw 1111H,2222H,3333H,4444H,5555H,6666H,7777H,8888H
data ends

stack segment
	db 10 dup(0)
stack ends

;栈本身就可以存取内存
code segment
start:	mov ax,data	;先将ds指向数据区
		mov ds,ax
		
		mov ax,stack ;获得栈地址
		mov ss,ax
		
		mov bx,0	;偏移量
		mov cx,8	;记录循环次数
		
		
for1:	push ds:arr[bx]		;这次循环将arr中存的dw数字全入栈了
		add bx,2
		loop for1
		
		mov bx,0	;偏移量
		mov cx,8	;记录循环次数
		
for2:	pop ds:arr[bx]		;这次循环将栈中的再取出反转放回自己那个位置
		add bx,2
		loop for2

		mov ax,4c00H
		int 21H
code ends
end start