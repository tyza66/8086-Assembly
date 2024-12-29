comment *
这种也是注释
* comment
assume cs:codesg,ds:data,ss:stack

data segment
	str db 'Hello world','$'
data ends

stack segment
	db 10 dup(0)
stack ends

codesg segment
start:	mov ax,data	;先将ds指向数据区
		mov ds,ax
		
		mov bx,0	;用于记录偏移量
		mov cx,11	;用于记录循环次数
		
s:		mov al,[bx]
		and al,1011111B ;使用一种技巧进行变成大写的转换（相当于减去20） 这种技巧不会影响到原本就是大写字母的地方
		;如果将and换成or al,100000B就可以实现小写转换（相当于加上20）
		mov [bx],al
		inc bx
		loop s
		
		lea dx,str ;相当于mov dx,offset str
		mov ah,9
		int 21H
		
		mov ah,4cH
		int 21H
		
codesg ends
end start