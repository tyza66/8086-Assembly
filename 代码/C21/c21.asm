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
		
		mov si,0	;相当于双指针
		mov di,7
		mov cx,8	;循环次数
		
for:	mov al,ds:arr[si]		
		mov ds:res[di],al
		inc si		;si增
		dec di		;di减
		loop for

		mov ax,4c00H
		int 21H
code ends
end start