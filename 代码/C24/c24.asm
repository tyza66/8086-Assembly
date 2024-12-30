assume cs:code,ds:data,ss:stack

data segment
	str db 'aaaacbbbbbccccc '	;这样声明的话因为在内存空间上是连续的 而一个一维数组可以同时认为它是一个二维数组
	db 'aaaacbbbbbccccc '
	db 'aaaacbbbbbccccc '
	db 'aaaacbbbbbccccc ','$'
data ends

stack segment
	db 10 dup(0)
stack ends

;让第四列全变成大写
code segment
start:	mov ax,data	;先将ds指向数据区
		mov ds,ax
		
		mov bx,0
		mov cx,4

for:	mov al,ds:str[bx+5]		;注意ds:str[2][5]不代表第二行第五个元素
		and al,11011111B
		mov ds:str[bx+5],al

		add bx,16
		loop for

		mov ax,4c00H
		int 21H
code ends
end start