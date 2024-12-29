assume cs:codesg,ds:data,ss:stack

data segment
	string db 'hello world',10,'666','$' ;美元符号相当于是一个截至符
	;10是换行的ascii码 32是空格的ascii码
data ends

stack segment
	db 10 dup(0)
stack ends

codesg segment
start:	mov ax,data
		mov ds,ax
		mov dx,offset string
		mov ah,9	;这样是输出
		int 21H
		
		mov ah,4ch	;这样是安全退出
		int 21H
codesg ends
end start