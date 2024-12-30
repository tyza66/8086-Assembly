assume cs:code,ds:data,ss:stack

data segment
	arr db 32H,34H,47H,31H,1H,21H,3H,55H,87H
data ends

stack segment
	db 10 dup(0)
stack ends

code segment
start:	mov ax,data	;先将ds指向数据区
		mov ds,ax
		
		mov bx,0
		mov cx,8	;减少一次防止死循环且不影响结果

for:	mov dx,cx	;把外层循环的dx存起来，避免内层循环影响外层循环的次数
		mov si,8
		mov cx,8
		sub cx,bx
		for1:	mov ah,ds:arr[si]			;内存交换需要中转一下
				mov al,ds:arr[si-1]
				cmp ah,al					;比较只能比较寄存器里面的
				jnb all
				xchg ah,al
				mov ds:arr[si],ah
				mov ds:arr[si-1],al
				all:	
					
		dec si
		loop for1
		mov cx,dx
		add bx,1
		loop for

		mov ax,4c00H
		int 21H
code ends
end start