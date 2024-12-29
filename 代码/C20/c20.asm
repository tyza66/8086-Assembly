assume cs:code,ds:data,ss:stack

data segment
	arr db 1,2,3,4,10,20,30,40
	res db 8 dup(0)
data ends

stack segment
	db 10 dup(0)
stack ends

code segment
start:	mov ax,data	;先将ds指向数据区
		mov ds,ax
		
		mov bx,0	;bx作为偏移地址
		mov cx,8	;循环次数
		
for:	mov al,ds:arr[bx]		;如此实现平行复试
		mov ds:res[bx],al
		inc bx
		loop for

		mov ax,4c00H
		int 21H
code ends
end start